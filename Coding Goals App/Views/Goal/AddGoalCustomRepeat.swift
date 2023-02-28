//
//  CustomReminder.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/18/23.
//

import SwiftUI

struct CustomRepeat: View {
    @Binding var goal: Goal
    var body: some View {
        Form {
            Picker("Frequency", selection: $goal.repeat.customRepeat) {
                ForEach (GoalCustomRepeatOptions.allCases, id: \.self) { goalRepeats in
                    Text(goalRepeats.rawValue.localizedCapitalized)
                        .tag(goalRepeats.rawValue)
                }
            }
            DisclosureGroup {
                HStack {
                    Picker("Every", selection: $goal.repeat.customFrequency) {
                        ForEach (1...999, id: \.self) { index in
                            Text(index.description)
                        }
                    }
                    .pickerStyle(.wheel)
                    Text($goal.repeat.customRepeat.getUnitLabel(count: $goal.repeat.customFrequency).lowercased())
                        .font(.title3)
                }
            } label: {
                HStack {
                    Text("Every")
                    Spacer()
                    Text($goal.repeat.customRepeat.getUnitLabelWithCount(count: $goal.repeat.customFrequency))
                        .foregroundColor(.gray)
                }
            }
            
        }
        .navigationTitle("Custom Repeat")
    }
}

struct CustomRepeat_Previews: PreviewProvider {
    static var previews: some View {
            CustomRepeat(goal: .constant(Goal.default()))
    }
}
