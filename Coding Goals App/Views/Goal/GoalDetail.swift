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
        Text(goal.description)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let dataStore = DataStore()
        
        GoalDetail(goal: dataStore.goals[0])
            .environmentObject(dataStore)
    }
}
