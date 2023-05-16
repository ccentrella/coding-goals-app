//
//  GoalRepeatOptions.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/22/23.
//

import Foundation

enum GoalRepeatOptions: String, Codable, CaseIterable {
    case never = "Never"
    case everyday = "Every Day"
    case everyweek = "Every Week"
    case everymonth = "Every Month"
    case everyyear = "Every Year"
}
