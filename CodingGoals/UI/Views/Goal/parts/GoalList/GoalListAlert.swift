//
//  GoalListAlert.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 7/15/23.
//

import SwiftUI

struct GoalListAlert: View {
    
    @EnvironmentObject var store: DataStore
    let upcomingGoals: [Goal]
    let recentlyCompletedGoals: [Goal]
    
    var body: some View {
        if !upcomingGoals.isEmpty {
            Section {
                if upcomingGoals.count == 1 {
                    AlertBanner(heading: "Upcoming Goal", description: upcomingGoals.first!.friendlyDescription, invert: true)
                        .padding()
                }
                else {
                    AlertBanner(heading: "Upcoming Goals", description: "You have multiple goals due soon.", invert: true)
                        .padding()
                }
                GoalList(goals: upcomingGoals)
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
                    CongratsBanner(heading: "Completed Goals", description: "You have completed multiple goals!", invert: true)
                        .padding()
                }
                GoalList(goals: recentlyCompletedGoals)
            }
        }
    }
}

struct GoalListAlert_Previews: PreviewProvider {
    static var previews: some View {
        let store: DataStore = DataStore()
        ScrollView {
            GoalListAlert(upcomingGoals: store.goals, recentlyCompletedGoals: store.goals)
                .environmentObject(store)
        }
    }
}
