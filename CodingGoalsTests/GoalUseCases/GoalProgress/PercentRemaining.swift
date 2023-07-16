//
//  PercentRemaining.swift
//  CodingGoalsTests
//
//  Created by Christopher Centrella on 4/19/23.
//

import Foundation
@testable import CodingGoals
import XCTest

final class PercentRemainingTest: XCTestCase {
    
    func testPercentRemaining() {
        let store: DataStore = DataStore()
        let goal: Goal = store.goals[0]
        let percentRemaining = 1 - goal.progress.percentCompleted
        
        assert(goal.progress.percentRemaining == percentRemaining)
    }
}
