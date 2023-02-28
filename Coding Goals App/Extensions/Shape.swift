//
//  Shape.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/24/23.
//

import Foundation
import SwiftUI

extension Shape {
    
    func fill (goalType: GoalType, style: FillStyle = FillStyle()) -> some View {
        let goalColor = goalType.getColor()
        return self.fill(goalColor)
    }

}
