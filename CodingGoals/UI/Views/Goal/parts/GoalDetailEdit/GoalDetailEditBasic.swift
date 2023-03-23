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
            Stepper(value: $data.overview.length) {
                HStack {
                    Text("Length")
                    Spacer()
                    Text(String(data.overview.length))
                        .padding(.trailing, 10.0)
                }
            }
            Picker("Type", selection: $data.overview.type) {
                ForEach (GoalType.allCases, id: \.self) { goalType in
                    Text(goalType.rawValue.localizedCapitalized)
                        .tag(goalType.rawValue)
                }
            }
            TextField("Add Description", text: $data.overview.description)
        }
    }
}

struct GoalDetailEditBasic_Previews: PreviewProvider {
    static var previews: some View {
        GoalDetailEditBasic(data: .constant(Goal.Data()))
    }
}
