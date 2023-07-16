//
//  GoalListAlert.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 7/15/23.
//

// Business Logic: Only one banner will be shown. If any goals are overdue, the overdue banner will be shown. Otherwise, if goals are due soon the upcoming banner will be shown. The congratulations banner has the lowest priority: It will be shown only if the other two conditions are false.

import SwiftUI

struct GoalListAlert: View {
    
    @EnvironmentObject var store: DataStore
    var overdueGoals: [Goal] {
        store.goals.filter({ goal in
            goal.status == .overdue
        })
    }
    var upcomingGoals: [Goal] {
        store.goals.filter({ goal in
            goal.status == .duesoon
        })
    }
    var recentlyCompletedGoals: [Goal] {
        store.goals.filter({ goal in
            goal.status == .recentlyCompleted
        })
    }

    var body: some View {
        if !overdueGoals.isEmpty {
            Section {
                if upcomingGoals.count == 1 {
                    AlertBanner(heading: "Overdue", description: upcomingGoals.first!.friendlyDescription, invert: true)
                        .padding()
                }
                else {
                    AlertBanner(heading: "Overdue", description: "You have multiple goals which are overdue.", invert: true)
                        .padding()
                    GoalList(goals: upcomingGoals)
                }
            }
        }
        else if !upcomingGoals.isEmpty {
            Section {
                if upcomingGoals.count == 1 {
                    AlertBanner(heading: "Upcoming Goal", description: upcomingGoals.first!.friendlyDescription, invert: true)
                        .padding()
                }
                else {
                    AlertBanner(heading: "Upcoming Goals", description: "You have multiple goals due soon.", invert: true)
                        .padding()
                    GoalList(goals: upcomingGoals)
                }
            }
        }
        else if !recentlyCompletedGoals.isEmpty {
            Section {
                if recentlyCompletedGoals.count == 1 {
                    CongratsBanner(heading: "Congratulations on completing your first goal",
                                   description: recentlyCompletedGoals.first!.friendlyDescription, invert: true)
                        .padding()
                }
                else {
                    CongratsBanner(heading: "Great Job!", description: "You have completed multiple goals.", invert: true)
                        .padding()
                    GoalList(goals: recentlyCompletedGoals)
                }
            }
        }
    }
}

struct GoalListAlert_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            GoalListAlert()
                .environmentObject(DataStore())
        }
    }
}
