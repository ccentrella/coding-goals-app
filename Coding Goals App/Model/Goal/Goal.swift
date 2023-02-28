//
//  Goal.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/17/23.
//

import Foundation

struct Goal: Codable, Identifiable, Hashable {
    var id: UUID
    var description: String
    var type: GoalType
    var length: Int
    var `repeat`: GoalRepeat
    var deadline: NullableDate
    var goalNotifications: GoalNotifications
    var notes: String
    
    static func `default`() -> Goal {
        return Goal(id: UUID(), description: "", type: GoalType.pages, length: 5, repeat: GoalRepeat(repeatOption: .never, customFrequency: 1, customRepeat: .weekly), deadline: NullableDate(), goalNotifications: GoalNotifications(id: UUID(), remindMe: GoalRemindMe.none, alert: GoalAlert.none, showAlertBanner: true, showCongratsBanner: true), notes: "")
    }
}

enum GoalType: String, Codable, CaseIterable {
    case pages
    case books
    case videos
    case functions
    case articles
    case apps
}
