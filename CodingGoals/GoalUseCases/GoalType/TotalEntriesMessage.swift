//
//  TotalEntriesMessage.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/22/23.
//

import Foundation

extension GoalType {
    
    func getTotalEntriesMessage() -> String {
        let noun = getNoun(count: 0)
        return "Total \(noun)"
    }
}
