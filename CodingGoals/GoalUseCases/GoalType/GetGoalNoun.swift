//
//  GoalNoun.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/22/23.
//

import Foundation

extension GoalType {
    
    func getNoun(count: Int) -> String {
        var noun: String
        
        if self == GoalType.articles || self == GoalType.books {
            noun = "pages"
        } else {
            noun = self.rawValue
        }
        return noun.pluralize(count: count)
    }
}
