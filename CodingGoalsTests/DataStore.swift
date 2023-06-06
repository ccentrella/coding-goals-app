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
        store.goals = []
        let expectation = XCTestExpectation(description: "Load file asynchronously.")
        store.loadGoals()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            assert(!store.goals.isEmpty, "Failed to load goals from file")
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 2)
    }
    
    func testSaveGoals() throws {
        let store: DataStore = DataStore()
        store.loadGoals()
        store.goals.append(Goal())
        
        let saveExpectation = XCTestExpectation(description: "Save file asynchronously.")
        store.saveGoals()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            let store2: DataStore = DataStore()
            store2.loadGoals()
            
            let loadExpectation = XCTestExpectation(description: "Load file asynchronously")
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                
                assert(store.goals.count == store2.goals.count, "Failed to save goals to file")
                loadExpectation.fulfill()
            })
            
            saveExpectation.fulfill()
        })
        wait(for: [saveExpectation], timeout: 4)
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
