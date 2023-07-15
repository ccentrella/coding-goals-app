//
//  GoalListView.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/18/23.
//

import SwiftUI

struct GoalListView: View {
    
    @EnvironmentObject var store: DataStore
    @State private var path: [Goal] = []
    @State private var isPresentingAddView = false
    @State private var data: Goal.Data = Goal.Data()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                let upcomingGoals: [Goal] = store.goals.filter({ goal in
                    goal.status.dueSoon
                })
                let recentlyCompletedGoals: [Goal] = store.goals.filter({ goal in
                    goal.status.isRecentlyComplete
                })
                let todoGoals: [Goal] = store.goals.filter({ goal in
                    !goal.status.isRecentlyComplete && !goal.status.isComplete
                })
                let completedGoals: [Goal] = store.goals.filter({ goal in
                    goal.status.isComplete
                })
                
                GoalListAlert(upcomingGoals: upcomingGoals, recentlyCompletedGoals: recentlyCompletedGoals)
                GoalListTodo(goals: todoGoals)
                GoalListCompleted(goals: completedGoals)
            }
            .listStyle(.grouped)
            .navigationDestination(for: Goal.self) { goal in
                GoalDetailView(goal: store.getBinding(goal: goal))
            }
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {
                            data = Goal.Data()
                            isPresentingAddView = true
                        } label: {
                            Label("New Goal", systemImage: "plus.circle.fill")
                                .bold()
                                .labelStyle(.titleAndIcon)
                        }
                        Spacer()
                    }
                }
            }
            .toolbar(.visible, for: .bottomBar)
            .navigationTitle("My Goals")
            .sheet(isPresented: $isPresentingAddView) {
                GoalDetailEditView(data: $data, isOpen: $isPresentingAddView, isNew: true, onSubmit: {
                    let goal = Goal(data: data)
                    store.goals.append(goal)
                   
                    Task {
                        try await NotificationService.addGoal(goal: goal)
                    }
                })
            }
        }
    }
}

struct GoalListView_Previews: PreviewProvider {
    static var previews: some View {
        GoalListView()
            .environmentObject(DataStore())
    }
}
