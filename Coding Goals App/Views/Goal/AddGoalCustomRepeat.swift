//
//  AddGoalCustomRepeat.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/18/23.
//

import SwiftUI

struct AddGoalCustomRepeat: View {
    @Binding var goalRepeat: GoalRepeat
    var body: some View {
        Form {
            Picker("Frequency", selection: $goalRepeat.customRepeat) {
                ForEach (GoalCustomRepeatOptions.allCases, id: \.self) { goalRepeats in
                    Text(goalRepeats.rawValue.localizedCapitalized)
                        .tag(goalRepeats.rawValue)
                }
            }
            DisclosureGroup {
                HStack {
                    Picker("Every", selection: $goalRepeat.customFrequency) {
                        ForEach (1...999, id: \.self) { index in
                            Text(index.description)
                        }
                    }
                    .pickerStyle(.wheel)
                    Text(goalRepeat.customRepeat.getUnitLabel(count: goalRepeat.customFrequency).lowercased())
                        .font(.title3)
                }
            } label: {
                HStack {
                    Text("Every")
                    Spacer()
                    Text(goalRepeat.customRepeat.getUnitLabelWithCount(count: goalRepeat.customFrequency))
                        .foregroundColor(.gray)
                }
            }
            
        }
        .navigationTitle("Custom Repeat")
    }
}

struct AddGoalCustomRepeat_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalCustomRepeat(goalRepeat: .constant(Goal.default().repeat))
    }
}
