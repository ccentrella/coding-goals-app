//
//  TotalEntriesConstructor.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/22/23.
//

import Foundation

extension GoalProgress {
    
    init(totalEntries: Int) {
        self.totalEntries = totalEntries
    }
    
    mutating func updateTotal(oldGoalOverview: GoalOverview, newGoalOverview: GoalOverview) {
        if self.totalEntries == oldGoalOverview.length {
            self.totalEntries = newGoalOverview.length
            self.entriesCompleted = min(entriesCompleted, newGoalOverview.length)
        }
    }
}
