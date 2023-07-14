//
//  GetGoalStatusPresenter.swift
//  CodingGoalsTests
//
//  Created by Christopher Centrella on 4/19/23.
//

import Foundation
@testable import CodingGoals
import XCTest

final class GetGoalStatusPresenterTest: XCTestCase {
    
    func testDefaultPercenter() {
        let store: DataStore = DataStore()
        let goal: Goal = store.goals[0]
        
        assert(!goal.status.isPercent && goal.status.presenter is DefaultGoalStatusPresenter,
               "Default goal status presenter not being returned")
    }
    
    func testPercentPresenter() {
        let store: DataStore = DataStore()
        let goal: Goal = store.goals[1]
        
        assert(goal.status.isPercent && goal.status.presenter is PercentGoalStatusPresenter,
               "Percent goal status presenter not being returned")
    }
    
}
