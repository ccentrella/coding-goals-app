//
//  GoalUpdateView.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/8/23.
//

import SwiftUI

struct GoalUpdateView: View {
    @Binding var status: GoalStatus
    
    var body: some View {
        Form {
            Stepper(value: $status.entriesCompleted) {
                HStack {
                    Text("Completed:")
                    Spacer()
                    Text(String(status.entriesCompleted))
                        .padding(.trailing, 10.0)
                }
            }
            if true {
                Stepper(value: $status.totalEntries) {
                    HStack {
                        Text("Total:")
                        Spacer()
                        Text(String(status.totalEntries))
                            .padding(.trailing, 10.0)
                    }
                }
            }
            Toggle("Use percent", isOn: $status.isPercent)
        }
    }
}

struct GoalUpdateView_Previews: PreviewProvider {
    static var previews: some View {
        GoalUpdateView(status: .constant(GoalStatus()))
    }
}
