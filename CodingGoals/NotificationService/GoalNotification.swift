//
//  GoalNotification.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/30/23.
//

import Foundation

struct GoalNotification: Comparable {
    
    var goalId: UUID
    var dueDate: Date
    
    static func < (lhs: GoalNotification, rhs: GoalNotification) -> Bool {
        
        return lhs.dueDate < rhs.dueDate
    }
}
