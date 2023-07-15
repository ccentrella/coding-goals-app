//
//  DefaultGoalStatusPresenter.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/11/23.
//

import Foundation

class DefaultGoalStatusPresenter: GoalStatusPresenter {
    
    func isTotalVisible(goal: Goal) -> Bool {
        return isArticlesOrBooks(goal: goal)
    }
    
    func getProgressMessage(goal: Goal) -> String {
        let entriesRemaining = goal.progress.entriesRemaining
        let type = goal.overview.type.getNoun(count: goal.progress.entriesRemaining)
        let verb = goal.overview.type.getVerb().lowercased()
        
        return "\(entriesRemaining) \(type) to \(verb)"
    }
    
    private func isArticlesOrBooks(goal: Goal) -> Bool {
        return goal.overview.type == GoalType.articles || goal.overview.type == GoalType.books
    }
}
