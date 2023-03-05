//
//  GoalDetail.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/18/23.
//

import SwiftUI

struct GoalDetail: View {
    
    @Binding var goal: Goal
    
    @State private var data = Goal.Data.default()
    @State private var isPresentingEditView = false
    
    var body: some View {
        VStack(spacing: 15) {
            GoalDetailIntro(goal: goal)
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
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(goal.type.getColor(), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .padding()
        .background(goal.type.getColor())
        .foregroundColor(.white)
        .sheet(isPresented: $isPresentingEditView) {
            EditGoal(data: $data, isOpen: $isPresentingEditView, isNew: false, onSubmit: {
                goal.update(from: data)
            })
        }
    }
}

struct GoalDetail_Previews: PreviewProvider {
    static var previews: some View {
        let dataStore = DataStore()
        
        NavigationStack {
            GoalDetail(goal: .constant(dataStore.goals[0]))
                .environmentObject(dataStore)
        }
    }
}
