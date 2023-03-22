//
//  GoalStatusHelper.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/10/23.
//

import Foundation

class GoalStatusHelper {

    static private var controller: GoalStatusController = DefaultGoalStatusController()
    
    static func setController(controller: GoalStatusController) {
        self.controller = controller
    }
    
    static func isTotalVisible(goal: Goal) -> Bool {
        return GoalStatusHelper.controller.isTotalVisible(goal: goal)
    }
    
    static func getProgressMessage(goal: Goal) -> String {
        return GoalStatusHelper.controller.getProgressMessage(goal: goal)
    }
    
}
