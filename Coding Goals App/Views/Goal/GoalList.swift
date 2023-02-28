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
    @State private var search: String = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            List (store.goals) { goal in
                NavigationLink(goal.description, value: goal.id)
            }
            .navigationDestination(for: Goal.self) { goal in
                GoalDetail(goal: goal)
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button(action: {}) {
                            Label("New Goal", systemImage: "plus.circle.fill")
                        }
                        .labelStyle(.titleAndIcon)
                        Spacer()
                    }
                }
            }.toolbar(.visible, for: .bottomBar)
                .searchable(text: $search)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        GoalList()
            .environmentObject(DataStore())
    }
}
