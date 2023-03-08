//
//  GoalStatus.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/7/23.
//

import Foundation
import SwiftUI

struct GoalStatus: Codable, Hashable {
    var progressValue: Double = 0.0
    var progressMessage: String = ""
    
    var progressPercent: String {
        let percent = progressValue * 100
        let rounded = Int(percent.rounded())
        return rounded.description
    }
}
