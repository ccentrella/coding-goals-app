//
//  GoalListAlert.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 7/15/23.
//

// Business Logic: Only one banner will be shown. If any goals are overdue, the overdue banner will be shown. Otherwise, if goals are due soon the upcoming banner will be shown. The congratulations banner has the lowest priority: It will be shown only if the other two conditions are false.

// Because overview banner has highest priority, the overdue items will always be shown. Congratulations banner is not always shown, but items that were recently completed will be shown in the GoalListCompleted component. However, we need to ensure that upcoming items are shown even if the upcoming banner is not.

import SwiftUI

struct GoalListAlert: View {
    
    @EnvironmentObject var store: DataStore
    @Binding var path: [Goal]
    var overdueGoals: [Goal] {
        store.goals.filter({ goal in
            goal.status == .overdue && goal.notifications.showAlertBanner
        })
    }
    var upcomingGoals: [Goal] {
        store.goals.filter({ goal in
            goal.status == .duesoon && goal.notifications.showAlertBanner
        })
    }
    var recentlyCompletedGoals: [Goal] {
        store.goals.filter({ goal in
            goal.status == .recentlyCompleted && goal.notifications.showCongratsBanner
        })
    }

    var body: some View {
        if !overdueGoals.isEmpty {
            Section {
                if overdueGoals.count == 1 {
                    AlertBanner(heading: "Overdue", description: overdueGoals.first!.friendlyDescription, actionText: "View Goal", onClick: { path.append(overdueGoals.first!) }, invert: true, critical: true)
                        .padding(.vertical)
                }
                else {
                    AlertBanner(heading: "Overdue", description: "You have multiple goals which are overdue.", invert: true, critical: true)
                        .padding(.vertical)
                }
                GoalList(goals: overdueGoals)
            }
        }
        else if !upcomingGoals.isEmpty {
            Section {
                if upcomingGoals.count == 1 {
                    AlertBanner(heading: "Upcoming Goal", description: upcomingGoals.first!.friendlyDescription, actionText: "View Goal",  onClick: { path.append(upcomingGoals.first!) }, invert: true)
                        .padding(.vertical)
                }
                else {
                    AlertBanner(heading: "Upcoming Goals", description: "You have multiple goals due soon.", invert: true)
                        .padding(.vertical)
                }
                GoalList(goals: upcomingGoals)
            }
        }
        else if !recentlyCompletedGoals.isEmpty {
            Section {
                if recentlyCompletedGoals.count == 1 {
                    CongratsBanner(heading: "Goal Complete",
                                   description: recentlyCompletedGoals.first!.friendlyDescription, actionText: "View Goal", onClick: { path.append(recentlyCompletedGoals.first!) }, invert: true)
                        .padding(.vertical)
                }
                else {
                    CongratsBanner(heading: "Great Job!", description: "You have completed multiple goals.", invert: true)
                        .padding(.vertical)
                }
                GoalList(goals: recentlyCompletedGoals)
            }
        }
        
        // Show upcoming items if upcoming banner will not be shown
        if !overdueGoals.isEmpty && !upcomingGoals.isEmpty {
            Section("Upcoming") {
                GoalList(goals: upcomingGoals)
            }
        }
    }
}

struct GoalListAlert_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            GoalListAlert(path: Binding.constant([]))
                .environmentObject(DataStore())
        }
    }
}
