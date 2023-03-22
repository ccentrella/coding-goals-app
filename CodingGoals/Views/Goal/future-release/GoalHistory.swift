//
//  GoalHistory.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/26/23.
//

import SwiftUI

struct GoalHistory: View {
    var body: some View {
        HStack {
            Text("History")
                .font(.largeTitle)
                .bold()
            Spacer()
        }
    }
}

struct GoalHistory_Previews: PreviewProvider {
    static var previews: some View {
        GoalHistory()
    }
}
