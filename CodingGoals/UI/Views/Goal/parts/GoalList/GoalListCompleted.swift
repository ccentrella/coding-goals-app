//
//  GoalListCompleted.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 7/15/23.
//

import SwiftUI

struct GoalListCompleted: View {
    
    @EnvironmentObject var store: DataStore
    var filteredGoals: [Goal] {
        store.goals.filter({ goal in
            goal.status == .completed || goal.status == .recentlyCompleted
        })
    }
    
    var body: some View {
        if !filteredGoals.isEmpty {
            Section("Completed") {
                GoalList(goals: filteredGoals)
            }
        }
    }
}

struct GoalListCompleted_Previews: PreviewProvider {
    static var previews: some View {
        GoalListCompleted()
            .environmentObject(DataStore())
    }
}
