//
//  EnvironmentValues.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 7/13/23.
//

import Foundation
import SwiftUI

struct NotificationPermissionsEnabledEnvironmentKey: EnvironmentKey {
    static var defaultValue = false
}

extension EnvironmentValues {
    
    var notificationPermissionsEnabled: Bool {
        get { self[NotificationPermissionsEnabledEnvironmentKey.self] }
        set { self[NotificationPermissionsEnabledEnvironmentKey.self] = newValue }
    }
}
