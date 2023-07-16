//
//  DataStore.swift
//  CodingGoalsTests
//
//  Created by Christopher Centrella on 4/19/23.
//

import Foundation
@testable import CodingGoals
import XCTest
import SwiftUI

final class DataStoreTest: XCTestCase {
    
    func testLoadGoals() throws {
        let store: DataStore = DataStore()
        let saveExpectation = XCTestExpectation(description: "Save file asynchronously.")
        store.saveGoals(completion: { _ in
            saveExpectation.fulfill()
        })
        
        wait(for: [saveExpectation], timeout: 5)
        let loadExpectation = XCTestExpectation(description: "Load file asynchronously.")
        store.goals = []
        store.loadGoals(completion: { _ in
            loadExpectation.fulfill()
        })
        
        wait(for: [loadExpectation], timeout: 5)
        assert(!store.goals.isEmpty, "Failed to load goals from file")
    }
    
    func testSaveGoals() throws {
        let store: DataStore = DataStore()
        let saveExpectation = XCTestExpectation(description: "Save file asynchronously.")
        store.goals.append(Goal())
        store.saveGoals(completion: { _ in
            saveExpectation.fulfill()
        })
                        
        wait(for: [saveExpectation], timeout: 5)
        let loadExpectation = XCTestExpectation(description: "Load file asynchronously.")
        let store2: DataStore = DataStore()
        store2.loadGoals(completion: { _ in
            loadExpectation.fulfill()
        })
        
        wait(for: [loadExpectation], timeout: 5)
        assert(store.goals.count == store2.goals.count, "Failed to save goals to file")
    }
    
    func testBinding() throws {
        let store: DataStore = DataStore()
        store.loadGoals()
        
        let goal: Goal = store.goals[0]
        let binding:Binding<Goal> = store.getBinding(goal: goal)
        binding.notes.wrappedValue = "Test"
        
        assert(store.goals[0].notes == "Test", "getBinding failed to update value")
    }
}
