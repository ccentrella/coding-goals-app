//
//  Coding_Goals_AppApp.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/17/23.
//

import SwiftUI

@main
struct CodingGoalsApp: App {
    
    @StateObject private var dataStore = DataStore()
    @Environment(\.scenePhase) private var scenePhase
    
    @State private var notificationsEnabled: Bool = false
    
    var body: some Scene {
        WindowGroup {
            GoalListView()
                .environmentObject(dataStore)
                .onAppear {
                    dataStore.loadGoals()
                    NotificationService.requestNotificationPermission()
                }
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive {
                        dataStore.saveGoals()
                    }
                    if phase == .active {
                        NotificationService.notificationsEnabled(completion: { authorized in
                           notificationsEnabled = authorized
                        })
                    }
                }.environment(\.notificationPermissionsEnabled, notificationsEnabled)
        }
    }
    
    
}
