//
//  GoalDetailIntro.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/1/23.
//

import SwiftUI

struct GoalDetailIntro: View {
    
    let goal: Goal
    var body: some View {
        HStack(spacing: 15) {
            ZStack {
                Circle()
                    .frame(height: 60)
                Image(goalType: goal.type)
                    .foregroundColor(goal.type.getColor())
            }
            Text(goal.friendlyDescription)
                .bold()
            Spacer()
        }
        .font(.system(.title2))
        .padding(.top, 5.0)
        .padding(.bottom, 10.0)
    }
}

struct GoalDetailIntro_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 15) {
            GoalDetailIntro(goal: Goal())
        }
        .padding()
    }
}
