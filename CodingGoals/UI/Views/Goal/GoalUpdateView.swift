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
                if goal.progress.isPercent {
                    VStack(alignment: .leading) {
                        Slider(value: $goal.progress.percentCompleted, in: 0...1, step: 0.01) {
                            Text("Progress")
                        }
                        Text("\(goal.progress.percentCompleted.formatted(.percent)) completed")
                    }
                }
                else {
                    Stepper(value: $goal.progress.entriesCompleted, in: 0...goal.progress.totalEntries) {
                        HStack {
                            Text(goal.overview.type.getEntriesCompletedMessage())
                            Spacer()
                            Text(String(goal.progress.entriesCompleted))
                                .padding(.trailing, 10.0)
                        }
                    }
                }
                if goal.progress.presenter.isTotalVisible(goal: goal) {
                    Stepper(value: $goal.progress.totalEntries) {
                        HStack {
                            Text(goal.overview.type.getTotalEntriesMessage())
                            Spacer()
                            Text(String(goal.progress.totalEntries))
                                .padding(.trailing, 10.0)
                        }
                    }
                }
                Toggle("Show percent", isOn: $goal.progress.isPercent)
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
