//
//  GoalParticiple.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/22/23.
//

import Foundation

extension GoalType {
    
    func getParticiple() -> String {
        switch (self) {
        case .pages, .articles, .books:
            return "read"
        case .apps, .functions:
            return "created"
        case .videos:
            return "watched"
        }
    }
}
