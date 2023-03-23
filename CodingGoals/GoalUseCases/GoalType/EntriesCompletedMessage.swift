//
//  EntriesCompletedMessage.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/22/23.
//

import Foundation

extension GoalType {
    
    func getEntriesCompletedMessage() -> String {
        let noun = getNoun(count: 0).capitalized
        let participle = getParticiple()
        
        return "\(noun) \(participle)"
    }
}
