//
//  GoalStatus.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 7/16/23.
//

import Foundation

extension Goal {
    
    var status: GoalStatus {
        
        if isOverdue() {
            return GoalStatus.overdue
        }
        else if isDueSoon() {
            return GoalStatus.duesoon
        }
        else if isRecentlyComplete() {
            return GoalStatus.recentlyCompleted
        }
        else if isComplete() {
            return GoalStatus.completed
        }
        else {
            return GoalStatus.todo
        }
    }
    
    private func isComplete() -> Bool {
        return progress.percentCompleted == 1
    }
    private func isRecentlyComplete() -> Bool {
        let dateCompleted: Date? = self.progress.dateCompleted
        return isComplete() && dateCompleted!.distance(to: Date.now) < 86400
    }
    private func isOverdue() -> Bool {
        let hasDeadline: Bool = overview.deadline.hasValue
        let pastDue: Bool = overview.deadline.date < Date.now
        return !isComplete() && hasDeadline && pastDue
    }
    private func isDueSoon() -> Bool {
        let hasDeadline: Bool = overview.deadline.hasValue
        let dueSoon: Bool = Date.now.distance(to: overview.deadline.date) < 86400
        return !isComplete() && hasDeadline && dueSoon
    }
}
