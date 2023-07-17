//
//  GoalDetailIntro.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/1/23.
//

import SwiftUI

struct GoalDetailIntro: View {
    
    @Binding var isPresentingUpdateView: Bool
    
    let goal: Goal
    var body: some View {
        VStack (alignment: .leading) {
            OverviewBanner(goal: goal, onClick: { isPresentingUpdateView = true })
            Text("Goal: \(goal.friendlyDescription)")
                .font(.callout)
                .bold()
                .padding(.top)
                .padding(.bottom, 5.0)
                .padding(.horizontal)
        }
    }
}

struct GoalDetailIntro_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 15) {
            GoalDetailIntro(isPresentingUpdateView: .constant(false), goal: Goal())
        }
        .padding()
    }
}
