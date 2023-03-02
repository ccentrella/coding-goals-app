//
//  GoalListItem.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/1/23.
//

import SwiftUI

struct GoalListItem: View {
    
    @EnvironmentObject var store: DataStore
    let goal: Goal
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(goalType: goal.type)
                    .frame(height: 50)
                Image(goalType: goal.type)
                    .foregroundColor(.white)
            }
            .padding(.trailing, 10.0)
            NavigationLink(goal.friendlyDescription, value: goal)
        }
        .swipeActions(edge: .trailing) {
            Button(role: .destructive) {
                store.goals.removeAll(where: { item in
                    item == goal
                })
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
}

struct GoalListItem_Previews: PreviewProvider {
    static var previews: some View {
        GoalListItem(goal: Goal.default())
            .environmentObject(DataStore())
    }
}
