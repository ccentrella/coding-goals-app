//
//  UpdateTotalEntries.swift
//  CodingGoalsTests
//
//  Created by Christopher Centrella on 4/19/23.
//

import Foundation
@testable import CodingGoals
import XCTest

final class UpdateTotalEntiesTest: XCTestCase {
    
    func testUpdateTotalEntriesInit() {
        let status: GoalProgress = GoalProgress(totalEntries: 29342934)
      
        assert(status.totalEntries == 29342934)
    }
    
    func testUpdateTotalEntriesWithDifferentLength() {
        let deadline = NullableDate(hasValue: true, date: Date.now)
        let overview: GoalOverview = GoalOverview(description: "Test description", type: .books, length: 5, deadline: deadline)
        let `repeat`: GoalRepeat = GoalRepeat(repeatOption: .everyday)
        let notifications: GoalNotifications = GoalNotifications(remindMe: .inevening, alert: .none, showAlertBanner: true, showCongratsBanner: true)
        let notes: String = "Some sample notes"
        let data: Goal.Data = Goal.Data(overview: overview, repeat: `repeat`, notifications: notifications, notes: notes)
        
        var goal1: Goal = Goal.init(data: data)
        goal1.progress.totalEntries = 15
        goal1.progress.entriesCompleted = 7
        goal1.overview.length = 4
        
        assert(goal1.progress.totalEntries == 15, "Total entries should only update if its current value is the same as the previous length")
        assert(goal1.progress.entriesCompleted == 7, "Entries completed should not be updated because total entry count is different than previous length")
    }
    
    func testUpdateTotalEntriesWithSameLength() {
        let deadline = NullableDate(hasValue: true, date: Date.now)
        let overview: GoalOverview = GoalOverview(description: "Test description", type: .books, length: 15, deadline: deadline)
        let `repeat`: GoalRepeat = GoalRepeat(repeatOption: .everyday)
        let notifications: GoalNotifications = GoalNotifications(remindMe: .inevening, alert: .none, showAlertBanner: true, showCongratsBanner: true)
        let notes: String = "Some sample notes"
        let data: Goal.Data = Goal.Data(overview: overview, repeat: `repeat`, notifications: notifications, notes: notes)
        
        var goal1: Goal = Goal.init(data: data)
        goal1.progress.totalEntries = 15
        goal1.progress.entriesCompleted = 7
        goal1.overview.length = 5
        
        assert(goal1.progress.totalEntries == 5, "Total entries should be updating with entries completed, because it's value has not diverged")
        assert(goal1.progress.entriesCompleted == 5, "Entries completed should be updated so that the value is not greater than the total number of entries")
    }
}
