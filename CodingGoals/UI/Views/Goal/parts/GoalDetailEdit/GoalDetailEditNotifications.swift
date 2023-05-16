//
//  GoalDetailEditNotifications.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/28/23.
//

import SwiftUI

struct GoalDetailEditNotifications: View {
    
    @Binding var data: Goal.Data
    
    var body: some View {
        if data.overview.deadline.hasValue {
            Section("Notifications") {
                Picker("Remind Me", selection: $data.notifications.remindMe) {
                    ForEach (GoalRemindMe.allCases, id: \.self) { goalRemindMe in
                        Text(goalRemindMe.rawValue)
                            .tag(goalRemindMe.rawValue)
                    }
                }
                Picker("Alert", selection: $data.notifications.alert) {
                    ForEach (GoalAlert.allCases, id: \.self) { goalAlert in
                        Text(goalAlert.rawValue)
                            .tag(goalAlert.rawValue)
                    }
                }
                Toggle("Show Alert Banner", isOn: $data.notifications.showAlertBanner)
                Toggle("Show Congrats Banner", isOn: $data.notifications.showCongratsBanner)
            }
        }
    }
}

struct GoalDetailEditNotifications_Previews: PreviewProvider {
    static var previews: some View {
        GoalDetailEditNotifications(data: .constant(Goal.Data()))
    }
}
