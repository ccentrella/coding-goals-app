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
        let alertBanner: [Goal] = store.goals.filter({ goal in
            let overdue: Bool = goal.status == .overdue && goal.notifications.showAlertBanner
            let duesoon: Bool = goal.status == .duesoon && goal.notifications.showAlertBanner
            let recentlyCompleted: Bool = goal.status == .recentlyCompleted && goal.notifications.showCongratsBanner
            return overdue || duesoon || recentlyCompleted
        })
        let showWelcomeBanner: Bool = store.goals.isEmpty
        let grouped = GroupedListStyle.grouped
        let automatic = DefaultListStyle.automatic
        let listStyle: any ListStyle = alertBanner.count > 0 || showWelcomeBanner ? grouped : automatic
        
        NavigationStack(path: $path) {
            AnyView(
                List {
                    if showWelcomeBanner {
                        Section {
                            InfoBanner(heading: "Welcome!", description: "Begin by creating a goal.", actionText: "Create Goal", onClick: {
                                    data = Goal.Data()
                                    isPresentingAddView = true
                            }, invert: true)
                            .padding(.vertical)
                        }
                    }
                    
                    GoalListAlert(path: $path)
                    GoalListTodo()
                    GoalListCompleted()
                }
                .listStyle(listStyle)
            )
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
