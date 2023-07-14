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
    
    func testAddGoal() async throws {
        let notificationCenter: UNUserNotificationCenter = UNUserNotificationCenter.current()
        let store: DataStore = DataStore()
        let goal: Goal = store.goals[2]
        
        notificationCenter.removeAllPendingNotificationRequests()
        
        try await NotificationService.addGoal(goal: goal)
        let pendingRequests = await notificationCenter.pendingNotificationRequests()
        
        assert(goal.overview.deadline.hasValue, "Sample goal does not have deadline value")
        assert(pendingRequests.count > 0, "Failed to add notification")
    }
    
    func testRemoveGoal() async throws {
        let notificationCenter: UNUserNotificationCenter = UNUserNotificationCenter.current()
        let store: DataStore = DataStore()
        let goal: Goal = store.goals[2]
        
        notificationCenter.removeAllPendingNotificationRequests()
        
        try await NotificationService.addGoal(goal: goal)
        NotificationService.removeGoal(goalId: goal.id)
        let pendingRequests = await notificationCenter.pendingNotificationRequests()
        
        assert(goal.overview.deadline.hasValue, "Sample goal does not have deadline value")
        assert(pendingRequests.count == 0, "Failed to remove notification")
    }
}
