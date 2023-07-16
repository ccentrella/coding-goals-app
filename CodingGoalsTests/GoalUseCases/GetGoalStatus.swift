//
//  GetGoalStatus.swift
//  CodingGoalsTests
//
//  Created by Christopher Centrella on 7/16/23.
//

import Foundation
@testable import CodingGoals
import XCTest

final class GetGoalStatusTest: XCTestCase {
    
    func testOverdueStatus() {
        let overdueGoalDate: Date = Date(timeIntervalSinceNow: -80000)
        let overdueGoalDeadline: NullableDate = NullableDate(hasValue: true, date: overdueGoalDate)
        let overdueGoal: Goal = createGoal(deadline: overdueGoalDeadline, progress: 0.8)
        
        let completedGoalDate: Date = Date(timeIntervalSinceNow: -80000)
        let completedGoalDeadline: NullableDate = NullableDate(hasValue: true, date: completedGoalDate)
        let completedGoal: Goal = createGoal(deadline: completedGoalDeadline, progress: 1.0)
        
        let upcomingGoalDate: Date = Date(timeIntervalSinceNow: 80000)
        let upcomingGoalDeadline: NullableDate = NullableDate(hasValue: true, date: upcomingGoalDate)
        let upcomingGoal: Goal = createGoal(deadline: upcomingGoalDeadline, progress: 0.8)
        
        let goalWithoutDeadlineDate: Date = Date(timeIntervalSinceNow: -80000)
        let goalWithoutDeadlineDeadline: NullableDate = NullableDate(hasValue: false, date: goalWithoutDeadlineDate)
        let goalWithoutDeadline: Goal = createGoal(deadline: goalWithoutDeadlineDeadline, progress: 0.8)
        
        assert(overdueGoal.status == GoalStatus.overdue, "Goal status should be set to overdue, but is instead set to \(overdueGoal.status)")
        assert(completedGoal.status != GoalStatus.overdue, "Goal status is being incorrectly set to overdue, but goal is already complete")
        assert(upcomingGoal.status != GoalStatus.overdue, "Goal status is being incorrectly set to overdue, but deadline is in the future")
        assert(goalWithoutDeadline.status != GoalStatus.overdue, "Goal status is being incorrectly set to overdue, but goal does not have a deadline")
    }
    
    func testDueSoonStatus() {
        let upcomingGoalDate: Date = Date(timeIntervalSinceNow: 80000)
        let upcomingGoalDeadline: NullableDate = NullableDate(hasValue: true, date: upcomingGoalDate)
        let upcomingGoal: Goal = createGoal(deadline: upcomingGoalDeadline, progress: 0.8)
        
        let overdueGoalDate: Date = Date(timeIntervalSinceNow: -80000)
        let overdueGoalDeadline: NullableDate = NullableDate(hasValue: true, date: overdueGoalDate)
        let overdueGoal: Goal = createGoal(deadline: overdueGoalDeadline, progress: 0.8)
        
        let completedGoalDate: Date = Date(timeIntervalSinceNow: 80000)
        let completedGoalDeadline: NullableDate = NullableDate(hasValue: true, date: completedGoalDate)
        let completedGoal: Goal = createGoal(deadline: completedGoalDeadline, progress: 1.0)
        
        let goalWithoutDeadlineDate: Date = Date(timeIntervalSinceNow: 80000)
        let goalWithoutDeadlineDeadline: NullableDate = NullableDate(hasValue: false, date: goalWithoutDeadlineDate)
        let goalWithoutDeadline: Goal = createGoal(deadline: goalWithoutDeadlineDeadline, progress: 0.8)
        
        assert(upcomingGoal.status == GoalStatus.duesoon, "Goal status should be set to due soon, but is instead being set to \(upcomingGoal.status)")
        assert(overdueGoal.status != GoalStatus.duesoon, "Goal status is being incorrectly set to due soon, but goal is overdue")
        assert(completedGoal.status != GoalStatus.duesoon, "Goal status is being incorrectly set to due soon, but goal is already complete")
        assert(goalWithoutDeadline.status != GoalStatus.duesoon, "Goal status is being incorrectly set to due soon, but goal does not have a deadline")
    }
    
    func testRecentlyCompletedStatus() {
        let recentlyCompletedGoalDate: Date = Date(timeIntervalSinceNow: 80000)
        let recentlyCompletedGoalDeadline: NullableDate = NullableDate(hasValue: true, date: recentlyCompletedGoalDate)
        let recentlyCompletedGoal: Goal = createGoal(deadline: recentlyCompletedGoalDeadline, progress: 1.0)

        let incompleteGoalDate: Date = Date(timeIntervalSinceNow: -80000)
        let incompleteGoalDeadline: NullableDate = NullableDate(hasValue: true, date: incompleteGoalDate)
        let incompleteGoal: Goal = createGoal(deadline: incompleteGoalDeadline, progress: 0.8)

        assert(recentlyCompletedGoal.status == GoalStatus.recentlyCompleted, "Goal status should be set to recently completed, but is instead being set to \(recentlyCompletedGoal.status)")
        assert(incompleteGoal.status != GoalStatus.recentlyCompleted, "Goal status is being incorrectly set to recently completed, but goal is not complete")
    }

    func testCompletedStatus() {
        let incompleteGoal: Goal = createGoal(deadline: NullableDate(), progress: 0.99)
        let incompleteGoal2: Goal = createGoal(deadline: NullableDate(), progress: 0.0)
        let recentlyCompletedGoal: Goal = createGoal(deadline: NullableDate(), progress: 1.0)

        assert(incompleteGoal.status != GoalStatus.completed, "Goal status is being incorrectly set to completed, but goal is incomplete")
        assert(incompleteGoal2.status != GoalStatus.completed, "Goal status is being incorrectly set to completed, but goal is incomplete")
        assert(recentlyCompletedGoal.status != GoalStatus.completed, "Goal status is being incorrectly set to completed, but goal should instead be set to recently completed")
    }
    
    func testTodoStatus() {
        let todoGoalDate: Date = Date(timeIntervalSinceNow: 800000)
        let todoGoalDeadline: NullableDate = NullableDate(hasValue: true, date: todoGoalDate)
        let todoGoal: Goal = createGoal(deadline: todoGoalDeadline, progress: 0.8)
        
        let completedGoalDate: Date = Date(timeIntervalSinceNow: 800000)
        let completedGoalDeadline: NullableDate = NullableDate(hasValue: true, date: completedGoalDate)
        let completedGoal: Goal = createGoal(deadline: completedGoalDeadline, progress: 1.0)
        
        let overdueGoalDate: Date = Date(timeIntervalSinceNow: -80000)
        let overdueGoalDeadline: NullableDate = NullableDate(hasValue: true, date: overdueGoalDate)
        let overdueGoal: Goal = createGoal(deadline: overdueGoalDeadline, progress: 0.8)
        
        let upcomingGoalDate: Date = Date(timeIntervalSinceNow: 80000)
        let upcomingGoalDeadline: NullableDate = NullableDate(hasValue: true, date: upcomingGoalDate)
        let upcomingGoal: Goal = createGoal(deadline: upcomingGoalDeadline, progress: 0.8)

        assert(todoGoal.status == GoalStatus.todo, "Goal status should be set to todo, but is instead being set to \(todoGoal.status)")
        assert(completedGoal.status != GoalStatus.todo, "Goal status is incorrectly set to todo, but is already complete")
        assert(overdueGoal.status != GoalStatus.todo, "Goal status is incorrectly set to todo, but should be set to overdue")
        assert(upcomingGoal.status != GoalStatus.todo, "Goal status is incorrectly set to todo, but should be set to upcoming")
    }
    
    private func createGoal(deadline: NullableDate, progress: Double) -> Goal {
        let overview: GoalOverview = GoalOverview(description: "read 25 pages", type: .pages, length: 25, deadline: deadline)
        let `repeat`: GoalRepeat = GoalRepeat()
        let notifications: GoalNotifications = GoalNotifications()
        let notes: String = "some sample notes"
        
        let data: Goal.Data = Goal.Data(overview: overview, repeat: `repeat`, notifications: notifications, notes: notes)
        var goal: Goal = Goal(data: data)
        goal.progress.percentCompleted = progress
        
        return goal
    }
}
