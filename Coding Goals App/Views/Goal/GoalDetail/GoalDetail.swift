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
            GoalDetailIntro(goal: goal)
            GoalDetailBody(goal: goal)
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
