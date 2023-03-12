//
//  PercentGoalStatusController.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/11/23.
//

import Foundation

class PercentGoalStatusController: GoalStatusController {
    
    func isTotalVisible(goal: Goal) -> Bool {
        return false
    }
    
    func getProgressMessage(goal: Goal) -> String {
        "\(goal.status.percentRemaining.formatted(.percent)) remaining"
    }
}
