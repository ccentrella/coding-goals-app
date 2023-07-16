//
//  GoalList.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 7/15/23.
//

import SwiftUI

struct GoalList: View {
    
    @EnvironmentObject var store: DataStore
    let goals: [Goal]
    
    var body: some View {
            ForEach (goals) { goal in
                GoalListItem(goal: goal)
            }
            .onDelete { offsets in
                offsets.forEach({ offset in
                    let goal = store.goals[offset]
                    NotificationService.removeGoal(goalId: goal.id)
                })
                store.goals.remove(atOffsets: offsets)
            }
    }
}

struct GoalList_Previews: PreviewProvider {
    static var previews: some View {
        let store: DataStore = DataStore()
        GoalList(goals: store.goals)
            .environmentObject(store)
    }
}
