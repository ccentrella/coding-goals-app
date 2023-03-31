//
//  NotificationService.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/30/23.
//

import Foundation

class NotificationService {
    
    static var goalsDueNow: [GoalNotification] = []
    static var goalsDueToday: [GoalNotification] = []
    static var goalsDueSoon: [GoalNotification] = []
    static var goalsDueThisWeek: [GoalNotification] = []
    static var goalsDueLater: [GoalNotification] = []
    
    static func addOrUpdateGoal(goalNotification: GoalNotification) {
        
        if isDueNow(goalNotification) {
            goalsDueNow.append(goalNotification)
            goalsDueNow.sort(by: >)
        }
        else if isDueToday(goalNotification) {
            goalsDueToday.append(goalNotification)
            goalsDueToday.sort(by: >)
        }
        else if isDueSoon(goalNotification) {
            goalsDueSoon.append(goalNotification)
            goalsDueSoon.sort(by: >)
        }
        else if isDueThisWeek(goalNotification) {
            goalsDueThisWeek.append(goalNotification)
            goalsDueThisWeek.sort(by: >)
        }
        else {
            goalsDueLater.append(goalNotification)
            goalsDueLater.sort(by: >)
        }
    }
    
    static func removeGoal(goalId: UUID) {
        goalsDueNow.removeAll(where: { goal in goal.goalId == goalId })
        goalsDueToday.removeAll(where: { goal in goal.goalId == goalId })
        goalsDueSoon.removeAll(where: { goal in goal.goalId == goalId })
        goalsDueThisWeek.removeAll(where: { goal in goal.goalId == goalId })
        goalsDueLater.removeAll(where: { goal in goal.goalId == goalId })
    }
    
    static private func weeklyTimer() {
        var goalNotification = goalsDueLater.last
        while goalNotification != nil && isDueThisWeek(goalNotification!) {
            goalsDueThisWeek.append(goalNotification!)
            goalsDueLater.removeLast()
            goalNotification = goalsDueLater.last
        }
    }
    static private func semiWeeklyTimer() {
        var goalNotification = goalsDueThisWeek.last
        while goalNotification != nil && isDueSoon(goalNotification!) {
            goalsDueSoon.append(goalNotification!)
            goalsDueThisWeek.removeLast()
            goalNotification = goalsDueThisWeek.last
        }
    }
    static private func dailyTimer() {
        var goalNotification = goalsDueSoon.last
        while goalNotification != nil && isDueToday(goalNotification!) {
            goalsDueToday.append(goalNotification!)
            goalsDueSoon.removeLast()
            goalNotification = goalsDueSoon.last
        }
    }
    static private func minuteTimer() {
        var goalNotification = goalsDueToday.last
        while goalNotification != nil && isDueNow(goalNotification!) {
            goalsDueNow.append(goalNotification!)
            goalsDueToday.removeLast()
            goalNotification = goalsDueToday.last
        }
    }
    
    static private func isDueThisWeek(_ goalNotification: GoalNotification) -> Bool {
        let timeRemaining = getTimeRemaining(date: goalNotification.dueDate)
        return timeRemaining <= TimeIntervalConstants.week
    }
    static private func isDueSoon(_ goalNotification: GoalNotification) -> Bool {
        let timeRemaining = getTimeRemaining(date: goalNotification.dueDate)
        return timeRemaining <= TimeIntervalConstants.semiWeek
    }
    static private func isDueToday(_ goalNotification: GoalNotification) -> Bool {
        let timeRemaining = getTimeRemaining(date: goalNotification.dueDate)
        return timeRemaining <= TimeIntervalConstants.day
    }
    static private func isDueNow(_ goalNotification: GoalNotification) -> Bool {
        let timeRemaining = getTimeRemaining(date: goalNotification.dueDate)
        return timeRemaining <= TimeIntervalConstants.minute
    }
    
    static private func getTimeRemaining(date: Date) -> TimeInterval {
        return date.distance(to: Date.now)
    }
    
    static private func showNotification() {
        
    }
}
