//
//  FriendlyDescription.swift
//  CodingGoalsTests
//
//  Created by Christopher Centrella on 4/19/23.
//

import Foundation
@testable import CodingGoals
import XCTest

final class FriendlyGoalDescriptionTest: XCTestCase {
    
    func testFriendlyDescriptionReturnsDescriptionWhenNotEmpty() throws {
        let store: DataStore = DataStore()
        let goal: Goal = store.goals[0]
        
        assert (!goal.overview.description.isEmpty && goal.friendlyDescription == goal.overview.description, "Friendly description not matching description")
    }
    
    func testFriendlyDescriptionReturnsGeneratedTextWhenEmpty() throws {
        let goal: Goal = Goal()
        
        assert (goal.overview.description.isEmpty && !goal.friendlyDescription.isEmpty, "Friendly description failed to be created")
    }
    
}
