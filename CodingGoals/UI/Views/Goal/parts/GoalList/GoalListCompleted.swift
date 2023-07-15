//
//  GoalListCompleted.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 7/15/23.
//

import SwiftUI

struct GoalListCompleted: View {
    
    @EnvironmentObject var store: DataStore
    let goals: [Goal]
    
    var body: some View {
        if !goals.isEmpty {
            Section("Completed") {
                GoalList(goals: goals)
            }
        }
    }
}

struct GoalListCompleted_Previews: PreviewProvider {
    static var previews: some View {
        let store: DataStore = DataStore()
        GoalListCompleted(goals: store.goals)
            .environmentObject(store)
    }
}
