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
            let overdue: Bool = goal.status == .overdue && goal.notifications.showAlertBanner
            let duesoon: Bool = goal.status == .duesoon && goal.notifications.showAlertBanner
            let recentlyCompleted: Bool = goal.status == .recentlyCompleted && goal.notifications.showCongratsBanner
            let completed: Bool = goal.status == .completed
            
            return !overdue && !duesoon && !recentlyCompleted && !completed
        })
    }

    var body: some View {
        if filteredGoals.count == store.goals.count {
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
