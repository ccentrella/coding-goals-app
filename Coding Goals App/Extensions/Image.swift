//
//  Image.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/24/23.
//

import Foundation
import SwiftUI

extension Image {
    
    init(goalType: GoalType) {
        let systemName = Image.getSystemImageName(goalType: goalType)
        self.init(systemName: systemName)
    }

    private static func getSystemImageName(goalType: GoalType) -> String {
        switch (goalType) {
        case .pages:
            return "doc.plaintext"
        case .books:
            return "book"
        case .videos:
            return "video"
        case .functions:
            return "function"
        case .articles:
            return "newspaper"
        case .apps:
            return "apps.iphone"
        }
    }
}
