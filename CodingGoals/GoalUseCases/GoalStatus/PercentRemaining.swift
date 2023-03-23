//
//  PercentRemaining.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/22/23.
//

import Foundation

extension GoalStatus {
    
    var percentRemaining: Double {
        1 - percentCompleted
    }
}
