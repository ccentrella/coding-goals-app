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
        let status: GoalStatus = GoalStatus(totalEntries: 29342934)
      
        assert(status.totalEntries == 29342934)
    }
    
    func testUpdateTotalEntriesUpdate() {
        let store: DataStore = DataStore()
        var goal: Goal = store.goals[0]
        
        goal.status.updateTotal(29342934)
        
        assert(goal.status.totalEntries == 29342934)
    }
}
