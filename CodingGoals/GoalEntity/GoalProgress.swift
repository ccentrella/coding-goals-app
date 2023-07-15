//
//  GoalProgress.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/7/23.
//

import Foundation
import SwiftUI

struct GoalProgress: Codable, Hashable {
    
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
    var isPercent: Bool = false
    
    var status: GoalStatus {
        GoalStatus.todo
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
