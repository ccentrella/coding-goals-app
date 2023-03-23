//
//  FriendlyGoalDescription.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/22/23.
//

import Foundation

extension Goal {
    
    var friendlyDescription: String {
        var description: String = overview.description
        if description.isEmpty {
            description = generateAutomaticDescription()
        }
        return description
    }
    
    private func generateAutomaticDescription() -> String {
        return "\(overview.type.getVerb()) \(overview.length) \(overview.type)"
    }
}
