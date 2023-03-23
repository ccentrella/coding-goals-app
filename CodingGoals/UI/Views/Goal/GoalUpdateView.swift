//
//  GoalUpdateView.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/8/23.
//

import SwiftUI

struct GoalUpdateView: View {
    @Binding var goal: Goal
    
    var body: some View {
        NavigationStack {
            Form {
                if goal.status.isPercent {
                    VStack(alignment: .leading) {
                        Slider(value: $goal.status.percentCompleted, in: 0...1, step: 0.01) {
                            Text("Progress")
                        }
                        Text("\(goal.status.percentCompleted.formatted(.percent)) completed")
                    }
                }
                else {
                    Stepper(value: $goal.status.entriesCompleted, in: 0...goal.status.totalEntries) {
                        HStack {
                            Text(goal.overview.type.getEntriesCompletedMessage())
                            Spacer()
                            Text(String(goal.status.entriesCompleted))
                                .padding(.trailing, 10.0)
                        }
                    }
                }
                if goal.status.presenter.isTotalVisible(goal: goal) {
                    Stepper(value: $goal.status.totalEntries) {
                        HStack {
                            Text(goal.overview.type.getTotalEntriesMessage())
                            Spacer()
                            Text(String(goal.status.totalEntries))
                                .padding(.trailing, 10.0)
                        }
                    }
                }
                Toggle("Show percent", isOn: $goal.status.isPercent)
            }
            .navigationTitle("Update Progress")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct GoalUpdateView_Previews: PreviewProvider {
    static var previews: some View {
        GoalUpdateView(goal: .constant(Goal()))
    }
}
