//
//  PercentRemaining.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/22/23.
//

import Foundation

extension GoalProgress {
    
    var percentRemaining: Double {
        1 - percentCompleted
    }
}
