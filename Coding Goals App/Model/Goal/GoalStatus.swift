//
//  GoalStatus.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/7/23.
//

import Foundation
import SwiftUI

struct GoalStatus: Codable, Hashable {
    
    var entriesCompleted: Int = 0 {
        didSet {
            updatePercent()
        }
    }
    var totalEntries: Int = 0 {
        didSet {
            updatePercent()
        }
    }
    var percentCompleted: Double = 0.0 {
        didSet {
            updateEntriesCompleted()
        }
    }
    
    var isPercent: Bool = false {
        willSet {
            var controller: GoalStatusController
            controller = newValue ? PercentGoalStatusController() : DefaultGoalStatusController()
            GoalStatusHelper.setController(controller: controller)
        }
    }
    
    var entriesRemaining: Int {
        return totalEntries - entriesCompleted
    }
    var percentRemaining: Double {
        return 1 - percentCompleted
    }
    
    private mutating func updatePercent() {
        let percent = Double(entriesCompleted) / Double(totalEntries)
        let roundedPercent = round(percent * 100) / 100
        if self.percentCompleted != roundedPercent {
            self.percentCompleted = roundedPercent
        }
    }
    private mutating func updateEntriesCompleted() {
        let entriesCompleted = percentCompleted * Double(totalEntries)
        let roundedEntriesCompleted = Int(round(entriesCompleted))
        if self.entriesCompleted != roundedEntriesCompleted {
            self.entriesCompleted = roundedEntriesCompleted
        }
    }
}

extension GoalStatus {
    init(totalEntries: Int) {
        self.totalEntries = totalEntries
    }
    
    mutating func updateTotal(_ newValue: Int) {
        self.totalEntries = newValue
    }
}
