//
//  GoalDetailEditBasic.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/28/23.
//

import SwiftUI

struct GoalDetailEditBasic: View {
    
    @Binding var data: Goal.Data
    
    var body: some View {
        Section("Basic Information") {
            Stepper(value: $data.length) {
                HStack {
                    Text("Length")
                    Spacer()
                    Text(String(data.length))
                        .padding(.trailing, 10.0)
                }
            }
            Picker("Type", selection: $data.type) {
                ForEach (GoalType.allCases, id: \.self) { goalType in
                    Text(goalType.rawValue.localizedCapitalized)
                        .tag(goalType.rawValue)
                }
            }
            TextField("Add Description", text: $data.description)
        }
    }
}

struct GoalDetailEditBasic_Previews: PreviewProvider {
    static var previews: some View {
        GoalDetailEditBasic(data: .constant(Goal.Data.default()))
    }
}
