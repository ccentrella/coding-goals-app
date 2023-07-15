//
//  GoalDetailEditView.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/3/23.
//

import SwiftUI

struct GoalDetailEditView: View {
    
    @Binding var data: Goal.Data
    @Binding var isOpen: Bool
    
    @Environment(\.notificationPermissionsEnabled) private var notificationsEnabled
    let isNew: Bool
    let onSubmit: () -> Void
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    GoalDetailEditBasic(data: $data)
                    GoalDetailEditOptions(data: $data)
                    GoalDetailEditNotifications(data: $data)
                    GoalDetailEditNotes(data: $data)
                }
                .navigationTitle(isNew ? "Add Goal" : "Edit Goal")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", action: {
                            isOpen = false
                        })
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done", action: {
                            isOpen = false
                            onSubmit()
                        })
                    }
                }
                if data.overview.deadline.hasValue && !notificationsEnabled {
                    AlertBanner(heading: "Notifications Disabled", description: "To access full app functionality, enable notifications.", actionText: "Enable Notifications", onClick: { NotificationService.showNotificationSettings() }, invert: true)
                        .padding()
                        .padding(.top, 15)
                }
            }
        }
    }
}

struct GoalDetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        GoalDetailEditView(data: .constant(Goal.Data()), isOpen: .constant(true), isNew: false, onSubmit: {})
    }
}
