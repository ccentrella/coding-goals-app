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
        if goal.status == .completed || goal.status == .recentlyCompleted {
            message = "Complete"
        }
        else {
            message = "\(goal.progress.percentRemaining.formatted(.percent)) remaining"
        }
        return message
    }
}
