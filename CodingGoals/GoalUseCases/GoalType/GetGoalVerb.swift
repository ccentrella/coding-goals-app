//
//  GoalVerb.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/22/23.
//

import Foundation

extension GoalType {
    
    func getVerb() -> String {
        switch (self) {
        case .pages, .articles, .books:
            return "Read"
        case .apps, .functions:
            return "Create"
        case .videos:
            return "Watch"
        }
    }
}
