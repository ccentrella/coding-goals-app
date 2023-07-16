//
//  GoalListTodo.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 7/15/23.
//

import SwiftUI

struct GoalListTodo: View {
    
    @EnvironmentObject var store: DataStore
    var filteredGoals: [Goal] {
        store.goals.filter({ goal in
            goal.status == .todo
        })
    }

    var body: some View {
        if store.goals.isEmpty {
            Text("Welcome! Begin by creating a goal.")
        }
        else if filteredGoals.count == store.goals.count {
            Section {
                GoalList(goals: filteredGoals)
            }
        }
        else if !filteredGoals.isEmpty {
            Section("All Goals") {
                GoalList(goals: filteredGoals)
            }
        }
    }
}

struct GoalListTodo_Previews: PreviewProvider {
    static var previews: some View {
        GoalListTodo()
            .environmentObject(DataStore())
    }
}
