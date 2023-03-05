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
    
    var friendlyDescription: String {
        return description.isEmpty ? generateAutomaticDescription() : description
    }
    private func generateAutomaticDescription() -> String {
        return "\(type.getVerb()) \(length) \(type)"
    }
    
    static func `default`() -> Goal {
        return Goal(id: UUID(), description: "", type: GoalType.pages, length: 5, repeat: GoalRepeat(repeatOption: .never, customFrequency: 1, customRepeat: .weekly), deadline: NullableDate(), goalNotifications: GoalNotifications(remindMe: GoalRemindMe.none, alert: GoalAlert.none, showAlertBanner: true, showCongratsBanner: true), notes: "")
    }
}

extension Goal {
    struct Data {
        var description: String
        var type: GoalType
        var length: Int
        var `repeat`: GoalRepeat
        var deadline: NullableDate
        var goalNotifications: GoalNotifications
        var notes: String
        
        static func `default`() -> Data {
            return Data(description: "", type: GoalType.pages, length: 5, repeat: GoalRepeat(repeatOption: .never, customFrequency: 1, customRepeat: .weekly), deadline: NullableDate(), goalNotifications: GoalNotifications(remindMe: GoalRemindMe.none, alert: GoalAlert.none, showAlertBanner: true, showCongratsBanner: true), notes: "")
        }
    }
    
    init(data: Data)
    {
        self.id = UUID()
        self.description = data.description
        self.type = data.type
        self.length = data.length
        self.repeat = data.repeat
        self.deadline = data.deadline
        self.goalNotifications = data.goalNotifications
        self.notes = data.notes
    }
    
    mutating func update(from data: Data) {
        self.description = data.description
        self.type = data.type
        self.length = data.length
        self.repeat = data.repeat
        self.deadline = data.deadline
        self.goalNotifications = data.goalNotifications
        self.notes = data.notes
    }
    
    var data: Data {
        Data(description: description, type: type, length: length, repeat: `repeat`, deadline: deadline, goalNotifications: goalNotifications, notes: notes)
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
