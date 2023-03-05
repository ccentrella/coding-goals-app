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
    
    func getColor() -> Color {
        switch (self) {
        case .pages:
            return Color.pink
        case .books:
            return Color.mint
        case .videos:
            return Color.blue
        case .functions:
            return Color.orange
        case .articles:
            return Color.green
        case .apps:
            return Color.purple
        }
    }
}
