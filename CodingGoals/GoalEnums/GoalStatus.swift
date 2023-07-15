//
//  GoalStatus.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 7/15/23.
//

import Foundation

enum GoalStatus: String, Codable, CaseIterable {
    case overdue
    case duesoon
    case recentlyCompleted
    case completed
    case todo
}
