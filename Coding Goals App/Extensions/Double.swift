//
//  Double.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/7/23.
//

import Foundation
import SwiftUI

extension Double {
    
    var percent: String {
        let percent = self * 100
        let rounded = Int(percent.rounded())
        return rounded.description
    }
}
