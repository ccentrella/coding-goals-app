//
//  TotalEntriesConstructor.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/22/23.
//

import Foundation

extension GoalProgress {
    
    init(totalEntries: Int) {
        self.totalEntries = totalEntries
    }
    
    mutating func updateTotal(_ newValue: Int) {
        self.totalEntries = newValue
    }
}
