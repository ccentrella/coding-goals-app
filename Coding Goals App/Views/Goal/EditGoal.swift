//
//  EditGoal.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/3/23.
//

import SwiftUI

struct EditGoal: View {
    
    @Binding var data: Goal.Data
    @Binding var isOpen: Bool
    
    @State private var path: [AddGoalPath] = []
    let isNew: Bool
    let onSubmit: () -> Void
    
    var body: some View {
        NavigationStack(path: $path) {
            Form {
                EditGoalBasic(data: $data)
                EditGoalOptions(data: $data, path: $path)
                EditGoalNotifications(data: $data)
                EditGoalNotes(data: $data)
            }
            .navigationTitle(isNew ? "Add Goal" : "Edit Goal")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", action: {
                        isOpen = false
                    })
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done", action: {
                        isOpen = false
                        onSubmit()
                    })
                }
            }
        }
    }
}

struct EditGoal_Previews: PreviewProvider {
    static var previews: some View {
        EditGoal(data: .constant(Goal.Data.default()), isOpen: .constant(true), isNew: false, onSubmit: {})
    }
}
