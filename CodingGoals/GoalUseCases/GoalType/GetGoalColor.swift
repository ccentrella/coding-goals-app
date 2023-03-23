//
//  GoalColor.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/22/23.
//

import Foundation
import SwiftUI

extension GoalType {
    
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
}
