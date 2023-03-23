//
//  GoalNotifications.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/17/23.
//

import Foundation

struct GoalNotifications: Codable, Hashable {
    var remindMe: GoalRemindMe = .none
    var alert: GoalAlert = .none
    var showAlertBanner: Bool = true
    var showCongratsBanner: Bool = true
}
