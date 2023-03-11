//
//  DefaultGoalStatusController.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/11/23.
//

import Foundation

class DefaultGoalStatusController: GoalStatusController {
    
    func isTotalVisible(goal: Goal) -> Bool {
        return isArticlesOrBooks(goal: goal)
    }
    
    func getProgressMessage(goal: Goal) -> String {
        "\(goal.status.entriesRemaining) \(goal.type) to \(goal.type.getVerb().lowercased())"
    }
    
    private func isArticlesOrBooks(goal: Goal) -> Bool {
        return goal.type == GoalType.articles || goal.type == GoalType.books
    }
}
