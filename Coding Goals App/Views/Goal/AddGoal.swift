//
//  AddGoal.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/18/23.
//

import SwiftUI

struct AddGoal: View {
    
    @State private var path: [AddGoalPath] = []
    @State private var goal: Goal = Goal.default()
    @Binding var isOpen: Bool
    @EnvironmentObject var store: DataStore
    
    var body: some View {
        NavigationStack(path: $path) {
            Form {
                Section("Basic Information") {
                    Stepper(value: $goal.length) {
                        HStack {
                            Text("Length")
                            Spacer()
                            Text(String(goal.length))
                                .padding(.trailing, 10.0)
                        }
                    }
                    Picker("Type", selection: $goal.type) {
                        ForEach (GoalType.allCases, id: \.self) { goalType in
                            Text(goalType.rawValue.localizedCapitalized)
                                .tag(goalType.rawValue)
                        }
                    }
                    TextField("Add Description", text: $goal.description)
                }
                Section("Options") {
                    Picker("Repeat", selection: $goal.repeat.repeatOption) {
                        ForEach (GoalRepeatOptions.allCases, id: \.self) { goalRepeat in
                            Text(goalRepeat.rawValue)
                                .tag(goalRepeat.rawValue)
                        }
                    }
                    Toggle("Enable Deadline", isOn: $goal.deadline.hasValue)
                    if goal.deadline.hasValue {
                        DatePicker("Deadline", selection: $goal.deadline.date)
                    }
                }

                Section("Notifications") {
                    Picker("Remind Me", selection: $goal.goalNotifications.remindMe) {
                        ForEach (GoalRemindMe.allCases, id: \.self) { goalRemindMe in
                            Text(goalRemindMe.rawValue)
                                .tag(goalRemindMe.rawValue)
                        }
                    }
                    Picker("Alert", selection: $goal.goalNotifications.alert) {
                        ForEach (GoalAlert.allCases, id: \.self) { goalAlert in
                            Text(goalAlert.rawValue)
                                .tag(goalAlert.rawValue)
                        }
                    }
                    Toggle("Show Alert Banner", isOn: $goal.goalNotifications.showAlertBanner)
                    Toggle("Show Congrats Banner", isOn: $goal.goalNotifications.showCongratsBanner)
                }
                
                Section {
                    TextField("Notes", text: $goal.notes)
                        .frame(minHeight: 75, alignment: .top)
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", action: {
                        isOpen = false
                    })
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done", action: {
                        goal.description = GoalService.generateDescription(goal: goal)
                        store.goals.append(goal)
                        isOpen = false
                    })
                }
            }
            .navigationDestination(for: AddGoalPath.self) { path in
                if path == .customRepeat {
                    AddGoalCustomRepeat(goalRepeat: $goal.repeat)
                }
            }
            .navigationTitle("Add Goal")
            .navigationBarTitleDisplayMode(.inline)
            .onDisappear(perform: {
                if !isOpen {
                    goal = Goal.default()
                }
            })
        }
        .onChange(of: goal.repeat.repeatOption, perform: { newValue in
            if newValue == GoalRepeatOptions.custom {
                path.append(.customRepeat)
            }
        })

    }
}

struct AddGoal_Previews: PreviewProvider {
    static var previews: some View {
        AddGoal(isOpen: .constant(true))
    }
}
