//
//  GoalListTodo.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 7/15/23.
//

import SwiftUI

struct GoalListTodo: View {
    
    @EnvironmentObject var store: DataStore
    let goals: [Goal]

    var body: some View {
        if store.goals.isEmpty {
            Text("Welcome! Begin by creating a goal.")
        }
        else if goals.count == store.goals.count {
            Section {
                GoalList(goals: goals)
            }
        }
        else if !goals.isEmpty {
            Section("All Goals") {
                GoalList(goals: goals)
            }
        }
    }
}

struct GoalListTodo_Previews: PreviewProvider {
    static var previews: some View {
        let store: DataStore = DataStore()
        GoalListTodo(goals: store.goals)
            .environmentObject(store)
    }
}
