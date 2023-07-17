//
//  GoalDetailBody.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/1/23.
//

import SwiftUI

struct GoalDetailBody: View {
    
    let goal: Goal
    @Environment(\.notificationPermissionsEnabled) private var notificationsEnabled
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                if goal.overview.deadline.hasValue {
                    Image(systemName: "clock")
                    Text("Due \(goal.overview.deadline.date.formatted(date: .complete, time: .shortened))")
                }
                else if goal.progress.dateCompleted != nil {
                    Image(systemName: "party.popper.fill")
                    Text("Completed \(goal.progress.dateCompleted!.formatted(date: .complete, time: .omitted))")
                }
                else {
                    Label("No deadline specified", systemImage: "clock")
                }
                Spacer()
            }
            if !goal.notes.isEmpty {
                HStack {
                    Text("Notes: \(goal.notes)")
                    Spacer()
                }
            }
            Spacer()
            if goal.overview.deadline.hasValue && !notificationsEnabled {
                AlertBanner(heading: "Notifications Disabled", description: "To access full app functionality, enable notifications.", actionText: "Enable Notifications", onClick: { NotificationService.showNotificationSettings() })
                    .padding(.top, 15)
            }
        }
    }
}

struct GoalDetailBody_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 15) {
            GoalDetailBody(goal: Goal())
        }
        .padding()
    }
}
