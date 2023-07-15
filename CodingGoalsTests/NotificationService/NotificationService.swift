//
//  NotificationService.swift
//  CodingGoalsTests
//
//  Created by Christopher Centrella on 4/19/23.
//

import Foundation
@testable import CodingGoals
import XCTest

final class NotificationServiceTest: XCTestCase {
    
    override func setUp() {
        let notificationCenter: UNUserNotificationCenter = UNUserNotificationCenter.current()
        notificationCenter.removeAllPendingNotificationRequests()
    }
    
    override func tearDown() {
        let notificationCenter: UNUserNotificationCenter = UNUserNotificationCenter.current()
        notificationCenter.removeAllPendingNotificationRequests()
    }
    
    func testAddGoalWithoutDeadline() async throws {
        let notificationCenter: UNUserNotificationCenter = UNUserNotificationCenter.current()
        let deadline = NullableDate(hasValue: false, date: Date.now.advanced(by: TimeInterval(60)))
        let overview: GoalOverview = GoalOverview(description: "Test description", type: .apps, length: 5, deadline: deadline)
        let `repeat`: GoalRepeat = GoalRepeat(repeatOption: .everyday)
        let notifications: GoalNotifications = GoalNotifications(remindMe: .fifteenminutesbefore, alert: .onehourbefore,
                                                                 showAlertBanner: true, showCongratsBanner: true)
        let notes: String = "Some sample notes"
        let data: Goal.Data = Goal.Data(overview: overview, repeat: `repeat`, notifications: notifications, notes: notes)
        
        let goal: Goal = Goal.init(data: data)
        try await NotificationService.addGoal(goal: goal)
        let pendingRequests = await notificationCenter.pendingNotificationRequests()
        
        assert(pendingRequests.count == 0, "Notifications should only be added if goal has deadline")
    }
    
    func testAddGoalWithNonRepeatingDeadlineOnly() async throws {
        let notificationCenter: UNUserNotificationCenter = UNUserNotificationCenter.current()
        let deadline = NullableDate(hasValue: true, date: Date.now.advanced(by: TimeInterval(60)))
        let overview: GoalOverview = GoalOverview(description: "Test description", type: .apps, length: 5, deadline: deadline)
        let `repeat`: GoalRepeat = GoalRepeat(repeatOption: .never)
        let notifications: GoalNotifications = GoalNotifications()
        let notes: String = "Some sample notes"
        let data: Goal.Data = Goal.Data(overview: overview, repeat: `repeat`, notifications: notifications, notes: notes)

        let goal: Goal = Goal.init(data: data)
        try await NotificationService.addGoal(goal: goal)
        let pendingRequests = await notificationCenter.pendingNotificationRequests()

        assert(pendingRequests.count != 0, "Notifications not added successfully.")
        assert(pendingRequests.count == 1, "Wrong number of notifications added.")

        let notification: UNNotificationRequest = pendingRequests.first!
        testDeadlineNotification(goal: goal, notification: notification)
    }
    
//    func testAddGoalWithNonRepeatingAlert() async throws {
//        let notificationCenter: UNUserNotificationCenter = UNUserNotificationCenter.current()
//        let deadline = NullableDate(hasValue: true, date: Date.now.advanced(by: TimeInterval(60)))
//        let overview: GoalOverview = GoalOverview(description: "Test description", type: .apps, length: 5, deadline: deadline)
//        let `repeat`: GoalRepeat = GoalRepeat(repeatOption: .never)
//        let notifications: GoalNotifications = GoalNotifications(remindMe: .none, alert: .fifteenminutesbefore, showAlertBanner: true, showCongratsBanner: true)
//        let notes: String = "Some sample notes"
//        let data: Goal.Data = Goal.Data(overview: overview, repeat: `repeat`, notifications: notifications, notes: notes)
//
//        let goal: Goal = Goal.init(data: data)
//        try await NotificationService.addGoal(goal: goal)
//        let pendingRequests = await notificationCenter.pendingNotificationRequests()
//
//        assert(pendingRequests.count != 0, "Notifications not added successfully.")
//        assert(pendingRequests.count != 1, "Only one notification was added. Two notifications should have been added, a deadline notification and an alert notification.")
//        assert(pendingRequests.count == 2, "Wrong number of notifications added. Two notifications should have been added, a deadline notification and an alert notification.")
//
//        let first_notification: UNNotificationRequest = pendingRequests[0]
//        let second_notification: UNNotificationRequest = pendingRequests[1]
//        testDeadlineNotification(goal: goal, notification: first_notification)
//        testAlertNotification(goal: goal, notification: second_notification)
//    }
//
//    func testAddGoalWithNonRepeatingRemindMe() async throws {
//        let notificationCenter: UNUserNotificationCenter = UNUserNotificationCenter.current()
//        let deadline = NullableDate(hasValue: true, date: Date.now.advanced(by: TimeInterval(60)))
//        let overview: GoalOverview = GoalOverview(description: "Test description", type: .apps, length: 5, deadline: deadline)
//        let `repeat`: GoalRepeat = GoalRepeat(repeatOption: .never)
//        let notifications: GoalNotifications = GoalNotifications(remindMe: .fifteenminutesbefore, alert: .none, showAlertBanner: true, showCongratsBanner: true)
//        let notes: String = "Some sample notes"
//        let data: Goal.Data = Goal.Data(overview: overview, repeat: `repeat`, notifications: notifications, notes: notes)
//
//        let goal: Goal = Goal.init(data: data)
//        try await NotificationService.addGoal(goal: goal)
//        let pendingRequests = await notificationCenter.pendingNotificationRequests()
//
//        assert(pendingRequests.count != 0, "Notifications not added successfully.")
//        assert(pendingRequests.count != 1, "Only one notification was added. Two notifications should have been added, a deadline notification and a remindme notification.")
//        assert(pendingRequests.count == 2, "Wrong number of notifications added. Two notifications should have been added, a deadline notification and a remindme notification.")
//
//        let first_notification: UNNotificationRequest = pendingRequests[0]
//        let second_notification: UNNotificationRequest = pendingRequests[1]
//        testDeadlineNotification(goal: goal, notification: first_notification)
//        testRemindMeNotification(goal: goal, notification: second_notification)
//    }
    
//    func testAddGoalWithNonRepeatingAlertAndRemindMe() async throws {
//        let notificationCenter: UNUserNotificationCenter = UNUserNotificationCenter.current()
//        let deadline = NullableDate(hasValue: true, date: Date.now.advanced(by: TimeInterval(60)))
//        let overview: GoalOverview = GoalOverview(description: "Test description", type: .apps, length: 5, deadline: deadline)
//        let `repeat`: GoalRepeat = GoalRepeat(repeatOption: .never)
//        let notifications: GoalNotifications = GoalNotifications(remindMe: .fifteenminutesbefore, alert: .none, showAlertBanner: true, showCongratsBanner: true)
//        let notes: String = "Some sample notes"
//        let data: Goal.Data = Goal.Data(overview: overview, repeat: `repeat`, notifications: notifications, notes: notes)
//
//        let goal: Goal = Goal.init(data: data)
//        try await NotificationService.addGoal(goal: goal)
//        let pendingRequests = await notificationCenter.pendingNotificationRequests()
//
//        assert(pendingRequests.count != 0, "Notifications not added successfully.")
//        assert(pendingRequests.count != 1, "Only one notification was added. Three notifications should have been added, a deadline notification, an alert notification and a remindme notification.")
//        assert(pendingRequests.count != 2, "Only two notifications were added. Three notifications should have been added, a deadline notification, an alert notification and a remindme notification.")
//        assert(pendingRequests.count == 3, "Wrong number of notifications added. Three notifications should have been added, a deadline notification, an alert notification and a remindme notification.")
//
//        let first_notification: UNNotificationRequest = pendingRequests[0]
//        let second_notification: UNNotificationRequest = pendingRequests[1]
//        let third_notification: UNNotificationRequest = pendingRequests[2]
//        testDeadlineNotification(goal: goal, notification: first_notification)
//        testAlertNotification(goal: goal, notification: second_notification)
//        testRemindMeNotification(goal: goal, notification: third_notification)
//    }
//
//    func testAddGoalWithRepeatingAlertAndRemindMe() async throws {
//        let notificationCenter: UNUserNotificationCenter = UNUserNotificationCenter.current()
//        let deadline = NullableDate(hasValue: true, date: Date.now.advanced(by: TimeInterval(60)))
//        let overview: GoalOverview = GoalOverview(description: "Test description", type: .apps, length: 5, deadline: deadline)
//        let `repeat`: GoalRepeat = GoalRepeat(repeatOption: .everyday)
//        let notifications: GoalNotifications = GoalNotifications(remindMe: .fifteenminutesbefore, alert: .none, showAlertBanner: true, showCongratsBanner: true)
//        let notes: String = "Some sample notes"
//        let data: Goal.Data = Goal.Data(overview: overview, repeat: `repeat`, notifications: notifications, notes: notes)
//
//        let goal: Goal = Goal.init(data: data)
//        try await NotificationService.addGoal(goal: goal)
//        let pendingRequests = await notificationCenter.pendingNotificationRequests()
//
//        assert(pendingRequests.count != 0, "Notifications not added successfully.")
//        assert(pendingRequests.count != 1, "Only one notification was added. Three notifications should have been added, a deadline notification, an alert notification and a remindme notification.")
//        assert(pendingRequests.count != 2, "Only two notifications were added. Three notifications should have been added, a deadline notification, an alert notification and a remindme notification.")
//        assert(pendingRequests.count == 3, "Wrong number of notifications added. Three notifications should have been added, a deadline notification, an alert notification and a remindme notification.")
//
//        let first_notification: UNNotificationRequest = pendingRequests[0]
//        let second_notification: UNNotificationRequest = pendingRequests[1]
//        let third_notification: UNNotificationRequest = pendingRequests[2]
//        testDeadlineNotification(goal: goal, notification: first_notification)
//        testAlertNotification(goal: goal, notification: second_notification)
//        testRemindMeNotification(goal: goal, notification: third_notification)
//    }
//
    func testRemoveGoal() async throws {
        let notificationCenter: UNUserNotificationCenter = UNUserNotificationCenter.current()
        let store: DataStore = DataStore()
        let goal: Goal = store.goals[2]
        
        try await NotificationService.addGoal(goal: goal)
        NotificationService.removeGoal(goalId: goal.id)
        let pendingRequests = await notificationCenter.pendingNotificationRequests()
        
        assert(goal.overview.deadline.hasValue, "Sample goal does not have deadline value")
        assert(pendingRequests.count == 0, "Failed to remove notification")
    }
    
    private func testDeadlineNotification(goal: Goal, notification: UNNotificationRequest) {
        let expected_identifier: String = "\(goal.id.uuidString)_deadline"
        let expected_title: String = "Goal Due Soon"
        let expected_body: String = goal.friendlyDescription
        let expected_repeat: Bool = goal.repeat.repeatOption != .never
        
        assert(notification.identifier == expected_identifier,
               "Wrong notification added. Added notification should have been of type 'deadline'.")
        assert(notification.content.title == expected_title, "Wrong notification title added.")
        assert(notification.content.body == expected_body, "Wrong notification body added.")
        assert(notification.trigger?.repeats == expected_repeat, "Notification repeat not working correctly.")
    }
    
    private func testAlertNotification(goal: Goal, notification: UNNotificationRequest) {
        let expected_identifier: String = "\(goal.id.uuidString)_alert"
        let expected_title: String = "Goal Due Soon"
        let expected_body: String = goal.friendlyDescription
        let expected_repeat: Bool = goal.repeat.repeatOption != .never
        
        assert(notification.identifier == expected_identifier,
               "Wrong notification added. Added notification should have been of type 'alert'.")
        assert(notification.content.title == expected_title, "Wrong notification title added.")
        assert(notification.content.body == expected_body, "Wrong notification body added.")
        assert(notification.trigger?.repeats == expected_repeat, "Notification repeat not working correctly.")
    }
    
    private func testRemindMeNotification(goal: Goal, notification: UNNotificationRequest) {
        let expected_identifier: String = "\(goal.id.uuidString)_remindme"
        let expected_title: String = "Goal Due Soon"
        let expected_body: String = goal.friendlyDescription
        let expected_repeat: Bool = goal.repeat.repeatOption != .never
        
        assert(notification.identifier == expected_identifier,
               "Wrong notification added. Added notification should have been of type 'remindme'.")
        assert(notification.content.title == expected_title, "Wrong notification title added.")
        assert(notification.content.body == expected_body, "Wrong notification body added.")
        assert(notification.trigger?.repeats == expected_repeat, "Notification repeat not working correctly.")
    }
}
