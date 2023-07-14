//
//  EditGoalData.swift
//  CodingGoalsTests
//
//  Created by Christopher Centrella on 7/13/23.
//

import Foundation
@testable import CodingGoals
import XCTest

final class EditGoalDataTest: XCTestCase {
    
    func testGoalCreatedFromData() throws {
        
        let deadline = NullableDate(hasValue: true, date: Date.now)
        let overview: GoalOverview = GoalOverview(description: "Test description", type: .apps, length: 5, deadline: deadline)
        let `repeat`: GoalRepeat = GoalRepeat(repeatOption: .everyday)
        let notifications: GoalNotifications = GoalNotifications(remindMe: .inevening, alert: .none, showAlertBanner: true, showCongratsBanner: true)
        let notes: String = "Some sample notes"
        let data: Goal.Data = Goal.Data(overview: overview, repeat: `repeat`, notifications: notifications, notes: notes)
        
        let goal: Goal = Goal.init(data: data)
        
        assert(goal.overview == overview, "Goal Overview not being created from data")
        assert(goal.repeat == `repeat`, "Goal Repeat not being created from data")
        assert(goal.notifications == notifications, "Goal Notifications not being created from data")
        assert(goal.notes == notes, "Goal notes not being created from data")
    }
    
    func testEditGoalDataUpdatesSuccessfully() throws {
        
        var goal: Goal = Goal()
        let deadline = NullableDate(hasValue: true, date: Date.now)
        let overview: GoalOverview = GoalOverview(description: "Test description", type: .apps, length: 5, deadline: deadline)
        let `repeat`: GoalRepeat = GoalRepeat(repeatOption: .everyday)
        let notifications: GoalNotifications = GoalNotifications(remindMe: .inevening, alert: .none, showAlertBanner: true, showCongratsBanner: true)
        let notes: String = "Some sample notes"
        let data: Goal.Data = Goal.Data(overview: overview, repeat: `repeat`, notifications: notifications, notes: notes)
        
        goal.update(from: data)
        
        assert(goal.overview == overview, "Goal Overview not being created from data")
        assert(goal.repeat == `repeat`, "Goal Repeat not being created from data")
        assert(goal.notifications == notifications, "Goal Notifications not being created from data")
        assert(goal.notes == notes, "Goal notes not being created from data")
    }
}
