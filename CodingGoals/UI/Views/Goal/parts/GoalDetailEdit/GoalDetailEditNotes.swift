//
//  GoalDetailEditNotes.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/28/23.
//

import SwiftUI

struct GoalDetailEditNotes: View {
    
    @Binding var data: Goal.Data
    
    var body: some View {
        Section {
            TextField("Notes", text: $data.notes)
                .frame(minHeight: 75, alignment: .top)
        }
    }
}

struct GoalDetailEditNotes_Previews: PreviewProvider {
    static var previews: some View {
        GoalDetailEditNotes(data: .constant(Goal.Data()))
    }
}
