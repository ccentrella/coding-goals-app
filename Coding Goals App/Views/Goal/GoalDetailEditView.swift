//
//  GoalDetailEditView.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/3/23.
//

import SwiftUI

struct GoalDetailEditView: View {
    
    @Binding var data: Goal.Data
    @Binding var isOpen: Bool
    
    let isNew: Bool
    let onSubmit: () -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                GoalDetailEditBasic(data: $data)
                GoalDetailEditOptions(data: $data)
                GoalDetailEditNotifications(data: $data)
                GoalDetailEditNotes(data: $data)
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

struct GoalDetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        GoalDetailEditView(data: .constant(Goal.Data.default()), isOpen: .constant(true), isNew: false, onSubmit: {})
    }
}
