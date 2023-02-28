//
//  GoalRepeat.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/17/23.
//

import Foundation

struct GoalRepeat: Codable, Hashable {
    var repeatOption: GoalRepeatOptions
    var customFrequency: Int
    var customRepeat: GoalCustomRepeatOptions
}

enum GoalRepeatOptions: String, Codable, CaseIterable {
    case never = "Never"
    case everyday = "Every Day"
    case everyweek = "Every Week"
    case everytwoweeks = "Every Two Weeks"
    case everymonth = "Every Month"
    case everyyear = "Every Year"
    case custom = "Custom"
}

enum GoalCustomRepeatOptions: String, Codable, CaseIterable {
    case daily = "Daily"
    case weekly = "Weekly"
    case monthly = "Monthly"
    case yearly = "Yearly"
}
