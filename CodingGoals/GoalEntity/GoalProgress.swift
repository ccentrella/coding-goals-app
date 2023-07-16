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
            updateDateCompleted()
        }
    }
    var totalEntries: Int = 0 {
        didSet {
            updatePercent()
            updateDateCompleted()
        }
    }
    var percentCompleted: Double = 0.0 {
        didSet {
            updateEntriesCompleted()
            updateDateCompleted()
        }
    }
    var isPercent: Bool = false
    var dateCompleted: Date? = nil

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
    private mutating func updateDateCompleted() {
        if percentCompleted != 1.0 {
            self.dateCompleted = nil
        }
        else if self.dateCompleted == nil {
            self.dateCompleted = Date.now
        }
    }
}
