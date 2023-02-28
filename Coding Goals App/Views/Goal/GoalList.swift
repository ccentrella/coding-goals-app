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
    @State private var addItem = false
    
    var body: some View {
        NavigationStack(path: $path) {
            List (store.goals) { goal in
                HStack {
                    ZStack {
                        Circle()
                            .fill(goalType: goal.type)
                            .frame(height: 50)
                        Image(goalType: goal.type)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 10.0)
                    NavigationLink(goal.description, value: goal)
                }
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        store.goals.remove(at: store.goals.firstIndex(of: goal)!)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
            .navigationDestination(for: Goal.self) { goal in
                GoalDetail(goal: goal)
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button(action: { addItem  = true }) {
                            Label("New Goal", systemImage: "plus.circle.fill")
                                .bold()
                        }
                        .labelStyle(.titleAndIcon)
                        Spacer()
                    }
                }
            }.toolbar(.visible, for: .bottomBar)
                .searchable(text: $search)
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
