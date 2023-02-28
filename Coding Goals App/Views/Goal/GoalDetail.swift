//
//  GoalDetail.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/18/23.
//

import SwiftUI

struct GoalDetail: View {
    
    let goal: Goal
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 15) {
                ZStack {
                    Circle()
                        .frame(height: 60)
                    Image(goalType: goal.type)
                        .foregroundColor(goal.type.getColor())
                }
                Text(goal.description)
                    .bold()
                Spacer()
            }
            .font(.system(.title2))
            .padding(.top, 5.0)
            .padding(.bottom, 10.0)
            
            HStack {
                if goal.deadline.hasValue {
                    Label("Due", systemImage: "clock")
                    Text(goal.deadline.date.description)
                }
                else {
                    Label("No deadline specified", systemImage: "clock")
                }
                Spacer()
            }
        
            HStack {
                Text(InspirationalMessage.getInspirationalMessage(goal: goal))
                    .font(.headline)
                    .padding(.top, 5.0)
                Spacer()
            }
            if !goal.notes.isEmpty {
                HStack {
                    Text("Notes: \(goal.notes)")
                    Spacer()
                }
            }
            Spacer()
        }
        .toolbar {
            EditButton()
        }
        .navigationTitle("Explore Goal")
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(goal.type.getColor(), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .padding()
        .background(goal.type.getColor())
        .foregroundColor(.white)
    }
}

struct GoalDetail_Previews: PreviewProvider {
    static var previews: some View {
        let dataStore = DataStore()
        
        NavigationStack {
            GoalDetail(goal: dataStore.goals[0])
                .environmentObject(dataStore)
        }
    }
}
