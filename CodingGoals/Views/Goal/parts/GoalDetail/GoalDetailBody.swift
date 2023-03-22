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
        HStack(alignment: .top) {
            if goal.deadline.hasValue {
                Image(systemName: "clock")
                Text("Due \(goal.deadline.date.formatted(date: .complete, time: .shortened))")
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
