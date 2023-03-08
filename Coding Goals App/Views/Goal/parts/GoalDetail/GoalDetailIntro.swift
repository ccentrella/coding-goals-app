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
        VStack (alignment: .leading) {
            OverviewBanner(goal: goal, description: "20 pages left", progress: 0.35, onUpdate: {})
                .padding(.bottom, 20.0)
            Text("Goal: \(goal.friendlyDescription)")
                .font(.callout)
                .bold()
        }
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
