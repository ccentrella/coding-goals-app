//
//  EntriesRemaining.swift
//  CodingGoalsTests
//
//  Created by Christopher Centrella on 4/19/23.
//

import Foundation
@testable import CodingGoals
import XCTest

final class EntriesRemainingTest: XCTestCase {
    
    func testEntriesRemaining() {
        let store: DataStore = DataStore()
        let goal: Goal = store.goals[0]
        let entriesRemaining = goal.progress.totalEntries - goal.progress.entriesCompleted
        
        assert(goal.progress.entriesRemaining == entriesRemaining)
    }
}
