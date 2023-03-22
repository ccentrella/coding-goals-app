//
//  GoalType.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/4/23.
//

import Foundation
import SwiftUI

enum GoalType: String, Codable, CaseIterable {
    case pages
    case books
    case videos
    case functions
    case articles
    case apps
}

extension GoalType {
    
    func getNoun(count: Int) -> String {
        var noun: String
        
        if self == GoalType.articles || self == GoalType.books {
            noun = "pages"
        } else {
            noun = self.rawValue
        }
        return noun.pluralize(count: count)
    }
    
    func getVerb() -> String {
        switch (self) {
        case .pages, .articles, .books:
            return "Read"
        case .apps, .functions:
            return "Create"
        case .videos:
            return "Watch"
        }
    }
    
    func getParticiple() -> String {
        switch (self) {
        case .pages, .articles, .books:
            return "read"
        case .apps, .functions:
            return "created"
        case .videos:
            return "watched"
        }
    }
    
    func getColor() -> Color {
        switch (self) {
        case .pages:
            return Color.pink
        case .books:
            return Color.teal
        case .videos:
            return Color.indigo
        case .functions:
            return Color.orange
        case .articles:
            return Color.brown
        case .apps:
            return Color.purple
        }
    }
    
    func getEntriesCompletedMessage() -> String {
        let noun = getNoun(count: 0).capitalized
        let participle = getParticiple()
        
        return "\(noun) \(participle)"
    }
    
    func getTotalEntriesMessage() -> String {
        let noun = getNoun(count: 0)
        return "Total \(noun)"
    }
}
