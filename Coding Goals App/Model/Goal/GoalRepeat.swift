//
//  GoalRepeat.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/17/23.
//

import Foundation

// Model exists to enable extension of repeat functionality
struct GoalRepeat: Codable, Hashable {
    var repeatOption: GoalRepeatOptions = .never
}

enum GoalRepeatOptions: String, Codable, CaseIterable {
    case never = "Never"
    case everyday = "Every Day"
    case everyweek = "Every Week"
    case everytwoweeks = "Every Two Weeks"
    case everymonth = "Every Month"
    case everyyear = "Every Year"
}
