//
//  GoalService.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/26/23.
//

import Foundation

public class GoalService {
    
    static func generateDescription(goal: Goal) -> String {
        return goal.description.isEmpty ? generateAutomaticDescription(goal) : goal.description
    }
    
    private static func generateAutomaticDescription(_ goal: Goal) -> String {
        return "\(goal.type.getVerb()) \(goal.length) \(goal.type)"
    }
}
