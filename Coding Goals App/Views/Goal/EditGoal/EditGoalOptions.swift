//
//  EditGoalOptions.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/28/23.
//

import SwiftUI

struct EditGoalOptions: View {
    
    @Binding var data: Goal.Data
    @Binding var path: [AddGoalPath]
    @State private var isSet = false
    
    var body: some View {
        Section("Options") {
            Toggle("Add Deadline", isOn: $data.deadline.hasValue)
            if data.deadline.hasValue {
                DatePicker("Deadline", selection: $data.deadline.date)
            }
            Picker("Repeat", selection: $data.repeat.repeatOption) {
                ForEach (GoalRepeatOptions.allCases, id: \.self) { goalRepeat in
                    Text(goalRepeat.rawValue)
                        .tag(goalRepeat.rawValue)
                    if goalRepeat == GoalRepeatOptions.everyyear {
                        Divider()
                    }
                }
            }
            .onChange(of: data.repeat.repeatOption) { _ in
                if data.repeat.repeatOption == .custom {
                    path.append(AddGoalPath.customRepeat)
                }
            }
        }
    }
}

struct EditGoalOptions_Previews: PreviewProvider {
    static var previews: some View {
        EditGoalOptions(data: .constant(Goal.Data.default()), path: .constant([]))
    }
}
