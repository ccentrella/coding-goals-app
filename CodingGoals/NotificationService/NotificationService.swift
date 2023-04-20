//
//  NotificationService.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/30/23.
//

import Foundation
import UserNotifications;

class NotificationService {
    
    private static let calendar: Calendar = Calendar(identifier: .gregorian)
    
    public static func addGoal(goal: Goal) async throws {
        
        if (goal.overview.deadline.hasValue) {
            try await addDeadlineNotification(goal: goal)
            try await addAlertNotification(goal: goal)
            try await addRemindMeNotification(goal: goal)
        }
    }
    
    public static func removeGoal(goalId: UUID) {
        
        let deadline_identifier = "\(goalId)_deadline"
        let alert_identifier = "\(goalId)_alert"
        let remindme_identifier = "\(goalId)_remindme"
        let identifiers: [String] = [deadline_identifier, alert_identifier, remindme_identifier]
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    private static func addDeadlineNotification(goal: Goal) async throws {
        
        let date: Date = goal.overview.deadline.date
        try await addNotification(goal: goal, date: date, notification: "deadline")
    }
    
    private static func addAlertNotification(goal: Goal) async throws {
        
        var date: Date
        switch (goal.notifications.alert) {
            case .none:
                return
            case .fifteenminutesbefore:
                date = goal.overview.deadline.date - 900
            case .thirtyminutesbefore:
                date = goal.overview.deadline.date - 1800
            case .onehourbefore:
                date = goal.overview.deadline.date - 3600
            case .twohoursbefore:
                date = goal.overview.deadline.date - 7200
        }
        
        try await addNotification(goal: goal, date: date, notification: "alert")
    }
    
    private static func addRemindMeNotification(goal: Goal) async throws {
        
        var date: Date = goal.overview.deadline.date
        switch (goal.notifications.remindMe) {
            case .none:
                return
            case .inmorning:
                date = getMorningDate(date: date)
            case .inevening:
                date = getEveningDate(date: date)
            case .fifteenminutesbefore:
                date = goal.overview.deadline.date - 900
            case .thirtyminutesbefore:
                date = goal.overview.deadline.date - 1800
            case .onehourbefore:
                date = goal.overview.deadline.date - 3600
            case .twohoursbefore:
                date = goal.overview.deadline.date - 7200
            case .onedaybefore:
                date = goal.overview.deadline.date - 86400
            case .twodaysbefore:
                date = goal.overview.deadline.date - 172800
            case .oneweekbefore:
                date = goal.overview.deadline.date - 604800
        }
        
        try await addNotification(goal: goal, date: date, notification: "remindme")
    }
    
    private static func addNotification(goal: Goal, date: Date, notification: String) async throws {
        
        var dateComponents: DateComponents = calendar.dateComponents(in: .autoupdatingCurrent, from: date)
        var content: UNNotificationContent = UNNotificationContent()
        var trigger: UNCalendarNotificationTrigger = UNCalendarNotificationTrigger(
            dateMatching: dateComponents,
            repeats: false)
        var request: UNNotificationRequest = UNNotificationRequest(
            identifier: "\(goal.id.uuidString)_\(notification)",
            content: content,
            trigger: trigger)
        
        let notificationCenter = UNUserNotificationCenter.current()
        try await notificationCenter.add(request)
    }
    
    private static func getMorningDate(date: Date) -> Date {
        
        var dateComponents: DateComponents = calendar.dateComponents(in: .autoupdatingCurrent, from: date)
        if (dateComponents.hour! < 8) {
            dateComponents.day! -= 1
        }
        
            dateComponents.hour = 8
            dateComponents.minute = 0
            dateComponents.second = 0
        
        return dateComponents.date!
    }
    
    private static func getEveningDate(date: Date) -> Date {
        
        var dateComponents: DateComponents = calendar.dateComponents(in: .autoupdatingCurrent, from: date)
        if (dateComponents.hour! < 17) {
            dateComponents.day! -= 1
        }
        
            dateComponents.hour = 17
            dateComponents.minute = 0
            dateComponents.second = 0
        
        return dateComponents.date!
    }
}
