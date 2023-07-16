//
//  EntriesRemaining.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/22/23.
//

import Foundation

extension GoalProgress {
    
    var entriesRemaining: Int {
        totalEntries - entriesCompleted
    }
}
