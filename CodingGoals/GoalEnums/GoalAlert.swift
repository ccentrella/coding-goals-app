//
//  GoalAlert.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/22/23.
//

import Foundation

enum GoalAlert: String, Codable, CaseIterable {
    case none = "None"
    case fifteenminutesbefore = "15 minutes before"
    case thirtyminutesbefore = "30 minutes before"
    case onehourbefore = "1 hour before"
    case twohoursbefore = "2 hours before"
}
