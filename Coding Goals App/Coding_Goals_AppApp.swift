//
//  Coding_Goals_AppApp.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/17/23.
//

import SwiftUI

@main
struct Coding_Goals_AppApp: App {
    
    @StateObject private var dataStore = DataStore()
    
    var body: some Scene {
        WindowGroup {
            GoalList()
                .environmentObject(dataStore)
        }
    }
}
