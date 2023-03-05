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
        Section("Notifications") {
            Picker("Remind Me", selection: $data.goalNotifications.remindMe) {
                ForEach (GoalRemindMe.allCases, id: \.self) { goalRemindMe in
                    Text(goalRemindMe.rawValue)
                        .tag(goalRemindMe.rawValue)
                }
            }
            Picker("Alert", selection: $data.goalNotifications.alert) {
                ForEach (GoalAlert.allCases, id: \.self) { goalAlert in
                    Text(goalAlert.rawValue)
                        .tag(goalAlert.rawValue)
                }
            }
            Toggle("Show Alert Banner", isOn: $data.goalNotifications.showAlertBanner)
            Toggle("Show Congrats Banner", isOn: $data.goalNotifications.showCongratsBanner)
        }
    }
}

struct GoalDetailEditNotifications_Previews: PreviewProvider {
    static var previews: some View {
        GoalDetailEditNotifications(data: .constant(Goal.Data()))
    }
}
