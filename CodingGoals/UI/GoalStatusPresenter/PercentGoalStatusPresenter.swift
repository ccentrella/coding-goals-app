//
//  PercentGoalStatusPresenter.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/11/23.
//

import Foundation

class PercentGoalStatusPresenter: GoalStatusPresenter {
    
    func isTotalVisible(goal: Goal) -> Bool {
        return false
    }
    
    func getProgressMessage(goal: Goal) -> String {
        var message: String
        if goal.progress.percentRemaining > 0.0 {
            message = "\(goal.progress.percentRemaining.formatted(.percent)) remaining"
        }
        else {
            message = "Complete"
        }
        return message
    }
}
