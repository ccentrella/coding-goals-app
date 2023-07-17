//
//  NotificationService.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/30/23.
//

import Foundation
import UserNotifications;
import SwiftUI

class NotificationService {
    
    @Environment(\.notificationPermissionsEnabled) private static var notificationPermissionsEnabled
    
    private static let calendar: Calendar = Calendar(identifier: .gregorian)

    public static func requestNotificationPermission() {
        let center: UNUserNotificationCenter = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge, .providesAppNotificationSettings]) { (granted, error) in }
    }
    
    public static func notificationsEnabled(completion: @escaping (Bool) -> Void){
        var authorized: Bool = false
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { (settings) in
            authorized = settings.authorizationStatus == .authorized
            completion(authorized)
        }
    }

    public static func showNotificationSettings() {
        if let settingsURL: URL = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(settingsURL)
        }
    }
    
    public static func addGoal(goal: Goal) async throws {
        
        if (goal.overview.deadline.hasValue) {
            try await addDeadlineNotification(goal: goal)
            try await addAlertNotification(goal: goal)
            try await addRemindMeNotification(goal: goal)
        }
    }
    
    public static func removeGoal(goalId: UUID) {
        
        let deadline_identifier: String = "\(goalId)_deadline"
        let alert_identifier: String = "\(goalId)_alert"
        let remindme_identifier: String = "\(goalId)_remindme"
        let identifiers: [String] = [deadline_identifier, alert_identifier, remindme_identifier]
        
        let notificationCenter: UNUserNotificationCenter = UNUserNotificationCenter.current()
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
        
        let identifier = "\(goal.id.uuidString)_\(notification)"
        let content: UNMutableNotificationContent = getNotificationContent(goal: goal)
        let dateTrigger = getNotificationDate(repeatOption: goal.repeat.repeatOption, date: date)

        let request: UNNotificationRequest = UNNotificationRequest(
            identifier: identifier,
            content: content,
            trigger: dateTrigger)
        
        let notificationCenter = UNUserNotificationCenter.current()
        try await notificationCenter.add(request)
    }
    
    private static func getNotificationContent(goal: Goal) -> UNMutableNotificationContent {
        
        let content: UNMutableNotificationContent = UNMutableNotificationContent()
        content.title = "Goal Due Soon"
        content.body = goal.friendlyDescription
        content.sound = .default
        
        return content
    }
    
    private static func getNotificationDate(repeatOption: GoalRepeatOptions, date: Date) -> UNCalendarNotificationTrigger {
        
        let dateComponents: DateComponents
        if (repeatOption == .never) {
            dateComponents = generateNotificationDateWithoutRepeat(repeatOption: repeatOption, date: date)
            return UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        } else {
            dateComponents = generateNotificationDateWithRepeat(repeatOption: repeatOption, date: date)
            return UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        }
    }
    
    private static func generateNotificationDateWithoutRepeat(repeatOption: GoalRepeatOptions, date: Date) -> DateComponents {
        
        var dateComponents: DateComponents = calendar.dateComponents(in: .autoupdatingCurrent, from: date)
        dateComponents.quarter = nil
        
        return dateComponents
    }
    
    private static func generateNotificationDateWithRepeat(repeatOption: GoalRepeatOptions, date: Date) -> DateComponents {
        
        var dateComponents: DateComponents = generateNotificationDateWithoutRepeat(repeatOption: repeatOption, date: date)
        dateComponents.year = nil
        
        switch (repeatOption) {
        case .everyday:
            dateComponents.weekday = nil
            dateComponents.day = nil
            dateComponents.month = nil
        case .everyweek:
            dateComponents.day = nil
            dateComponents.month = nil
        case .everymonth:
            dateComponents.month = nil
            dateComponents.weekday = nil
        default:
            dateComponents.weekday = nil
        }
        
        return dateComponents
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
