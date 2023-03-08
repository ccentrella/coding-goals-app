//
//  Goal.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/17/23.
//

import Foundation

struct Goal: Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    var description: String = ""
    var type: GoalType = .pages
    var length: Int = 5
    var `repeat`: GoalRepeat = GoalRepeat()
    var deadline: NullableDate = NullableDate()
    var goalNotifications: GoalNotifications = GoalNotifications()
    var notes: String = ""
    var status: GoalStatus = GoalStatus()
    
    var friendlyDescription: String {
        return description.isEmpty ? generateAutomaticDescription() : description
    }
    private func generateAutomaticDescription() -> String {
        return "\(type.getVerb()) \(length) \(type)"
    }
}

extension Goal {
    
    struct Data {
        var description: String = ""
        var type: GoalType = .pages
        var length: Int = 5
        var `repeat`: GoalRepeat = GoalRepeat()
        var deadline: NullableDate = NullableDate()
        var goalNotifications: GoalNotifications = GoalNotifications()
        var notes: String = ""
    }
    var data: Data {
        Data(description: description, type: type, length: length,
             repeat: `repeat`, deadline: deadline,
             goalNotifications: goalNotifications, notes: notes)
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
        self.status = GoalStatus()
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
}
