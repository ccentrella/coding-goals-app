//
//  GoalData.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/22/23.
//

import Foundation

extension Goal {
    
    struct Data {
        var overview: GoalOverview = GoalOverview()
        var `repeat`: GoalRepeat = GoalRepeat()
        var notifications: GoalNotifications = GoalNotifications()
        var notes: String = ""
    }
    
    var data: Data {
        Data(overview: overview, repeat: `repeat`,
             notifications: notifications, notes: notes)
    }
    
    init(data: Data)
    {
        self.id = UUID()
        self.overview = data.overview
        self.repeat = data.repeat
        self.notifications = data.notifications
        self.progress = GoalProgress(totalEntries: overview.length)
        self.notes = data.notes
    }
    
    mutating func update(from data: Data) {
        self.overview = data.overview
        self.repeat = data.repeat
        self.notifications = data.notifications
        self.notes = data.notes
    }
}
