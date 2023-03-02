//
//  GoalList.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/18/23.
//

import SwiftUI

struct GoalList: View {
    
    @EnvironmentObject var store: DataStore
    @State private var path: [Goal] = []
    @State private var addItem = false
    
    var body: some View {
        NavigationStack(path: $path) {
            List (store.goals) { goal in
                GoalListItem(goal: goal)
            }
            .navigationDestination(for: Goal.self) { goal in
                GoalDetail(goal: goal)
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {
                            addItem = true
                        } label: {
                            Label("New Goal", systemImage: "plus.circle.fill")
                                .bold()
                                .labelStyle(.titleAndIcon)
                        }
                        Spacer()
                    }
                }
            }
            .toolbar(.visible, for: .bottomBar)
            .navigationTitle("My Goals")
            .sheet(isPresented: $addItem) {
                AddGoal(isOpen: $addItem)
            }
        }
    }
}

struct GoalList_Previews: PreviewProvider {
    static var previews: some View {
        GoalList()
            .environmentObject(DataStore())
    }
}
