//
//  GoalDetailView.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/18/23.
//

import SwiftUI

struct GoalDetailView: View {
    
    @Binding var goal: Goal
    
    @State private var data = Goal.Data()
    @State private var isPresentingEditView = false
    @State private var isPresentingUpdateView = false
    
    let heights = stride(from: 0.25, through: 0.85, by: 0.1).map { fraction in PresentationDetent.fraction(fraction) }
    
    var body: some View {
        VStack(spacing: 15) {
            GoalDetailIntro(isPresentingUpdateView: $isPresentingUpdateView, goal: goal)
            GoalDetailBody(goal: goal)
            Spacer()
        }
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = goal.data
            }
        }
        .navigationTitle("Explore Goal")
        .padding()
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(goal.overview.type.getColor(), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .background(goal.overview.type.getColor())
        .foregroundColor(.white)
        .sheet(isPresented: $isPresentingEditView) {
            GoalDetailEditView(data: $data, isOpen: $isPresentingEditView, isNew: false, onSubmit: {
                goal.update(from: data)
                
                NotificationService.removeGoal(goalId: goal.id)
                Task {
                    try await NotificationService.addGoal(goal: goal)
                }
            })
        }
        .sheet(isPresented: $isPresentingUpdateView) {
            GoalUpdateView(goal: $goal)
                .presentationDetents([.fraction(0.4), .medium])
                .presentationDragIndicator(.visible)
        }
    }
}

struct GoalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let dataStore = DataStore()
        
        NavigationStack {
            GoalDetailView(goal: .constant(dataStore.goals[0]))
                .environmentObject(dataStore)
        }
    }
}
