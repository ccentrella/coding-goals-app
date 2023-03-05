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
    @State private var data: Goal.Data = Goal.Data.default()
    
    var body: some View {
        NavigationStack(path: $path) {
            List (store.goals) { goal in
                GoalListItem(goal: goal)
            }
            .navigationDestination(for: Goal.self) { goal in
                GoalDetailView(goal: store.getBinding(goal: goal))
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {
                            data = Goal.Data.default()
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
