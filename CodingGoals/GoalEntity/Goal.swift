//
//  Goal.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/17/23.
//

import Foundation

struct Goal: Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    var overview: GoalOverview = GoalOverview() {
        willSet {
            self.progress.updateTotal(oldGoalOverview: self.overview, newGoalOverview: newValue)
        }
    }
    var `repeat`: GoalRepeat = GoalRepeat()
    var notifications: GoalNotifications = GoalNotifications()
    var progress: GoalProgress = GoalProgress()
    var notes: String = ""
}
