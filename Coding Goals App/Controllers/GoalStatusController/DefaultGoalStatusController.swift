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
        let entriesRemaining = goal.status.entriesRemaining
        let type = goal.type.getNoun(count: goal.status.entriesRemaining)
        let verb = goal.type.getVerb().lowercased()
        
        return "\(entriesRemaining) \(type) to \(verb)"
    }
    
    private func isArticlesOrBooks(goal: Goal) -> Bool {
        return goal.type == GoalType.articles || goal.type == GoalType.books
    }
}
