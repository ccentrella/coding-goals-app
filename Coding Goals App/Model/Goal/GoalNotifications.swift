//
//  GoalNotifications.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/17/23.
//

import Foundation

struct GoalNotifications: Codable, Identifiable, Hashable {
    var id: UUID
    var remindMe: GoalRemindMe
    var alert: GoalAlert
    var showAlertBanner: Bool
    var showCongratsBanner: Bool
}

enum GoalRemindMe: String, Codable, CaseIterable {
    case none = "None"
    case inmorning = "In the morning"
    case inevening = "In the evening"
    case fifteenminutesbefore = "15 minutes before"
    case thirtyminutesbefore = "30 minutes before"
    case onehourbefore = "1 hour before"
    case twohoursbefore = "2 hours before"
    case onedaybefore = "1 day before"
    case twodaysbefore = "2 days before"
    case oneweekbefore = "1 week before"
}

enum GoalAlert: String, Codable, CaseIterable {
    case none = "None"
    case fifteenminutesbefore = "15 minutes before"
    case thirtyminutesbefore = "30 minutes before"
    case onehourbefore = "1 hour before"
    case twohoursbefore = "2 hours before"
}
