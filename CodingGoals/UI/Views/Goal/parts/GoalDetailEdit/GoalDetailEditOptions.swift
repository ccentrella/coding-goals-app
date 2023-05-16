//
//  GoalDetailEditOptions.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/28/23.
//

import SwiftUI

struct GoalDetailEditOptions: View {
    
    @Binding var data: Goal.Data
    @State private var isSet = false
    
    var body: some View {
        Section("Options") {
            Toggle("Add Deadline", isOn: $data.overview.deadline.hasValue)
            if data.overview.deadline.hasValue {
                DatePicker("Deadline", selection: $data.overview.deadline.date)
                Picker("Repeat", selection: $data.repeat.repeatOption) {
                    ForEach (GoalRepeatOptions.allCases, id: \.self) { goalRepeat in
                        Text(goalRepeat.rawValue)
                            .tag(goalRepeat.rawValue)
                    }
                }
            }
        }
    }
}

struct GoalDetailEditOptions_Previews: PreviewProvider {
    static var previews: some View {
        GoalDetailEditOptions(data: .constant(Goal.Data()))
    }
}
