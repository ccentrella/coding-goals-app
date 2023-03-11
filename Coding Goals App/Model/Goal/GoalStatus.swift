//
//  GoalStatus.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/7/23.
//

import Foundation
import SwiftUI

struct GoalStatus: Codable, Hashable {
    var entriesCompleted: Int = 0
    var totalEntries: Int = 0
    var isPercent: Bool = false {
        
        // TODO: We need to update total and progress somehow, depending on whether isPercent is selected. It should seamlessly transition without changing progres. However, we do want the interface to change. For example, if there are seven entries and entries completed was marked 5, entries completed if it represents the percent, needs to update to 71
        
        // TODO: Perhaps we should use a different control when isPercent is selected, because manually pressing the plus button numerosus can be an exhausting user experience
        willSet {
            var controller: GoalStatusController
            var newTotal: Int
            
            if newValue {
                controller = PercentGoalStatusController()
                newTotal = 100
            }
            else {
                controller = DefaultGoalStatusController()
                newTotal = length
            }
            
            GoalStatusHelper.setController(controller: controller)
            self.updateTotal(newTotal)
        }
    }
    
    var entriesRemaining: Int {
        return totalEntries - entriesCompleted
    }
    var progress: Double {
        return totalEntries == 0 ? 0 : Double(entriesCompleted) / Double(totalEntries)
    }
    var progressPercent: Int {
        let percent = progress * 100
        let rounded = Int(percent.rounded())
        return rounded
    }
    var progressPercentRemaining: Int {
        return 100 - progressPercent
    }
}

extension GoalStatus {
    init(totalEntries: Int) {
        self.totalEntries = totalEntries
    }
    
    mutating func updateTotal(_ newValue: Int) {
        if !self.isPercent {
            self.totalEntries = newValue
        }
    }
}
