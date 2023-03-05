//
//  GoalDetailBody.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/1/23.
//

import SwiftUI

struct GoalDetailBody: View {
    
    let goal: Goal
    var body: some View {
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
    }
}

struct GoalDetailBody_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 15) {
            GoalDetailBody(goal: Goal())
        }
        .padding()
    }
}
