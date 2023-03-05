//
//  EditGoalNotes.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/28/23.
//

import SwiftUI

struct EditGoalNotes: View {
    
    @Binding var data: Goal.Data
    var body: some View {
        Section {
            TextField("Notes", text: $data.notes)
                .frame(minHeight: 75, alignment: .top)
        }
    }
}

struct EditGoalNotes_Previews: PreviewProvider {
    static var previews: some View {
        EditGoalNotes(data: .constant(Goal.Data.default()))
    }
}
