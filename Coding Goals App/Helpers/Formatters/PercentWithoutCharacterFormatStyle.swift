//
//  PercentWithoutCharacterFormatStyle.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/11/23.
//

import Foundation

class PercentWithoutCharacterFormatStyle: FormatStyle {
    typealias FormatInput = Double
    
    typealias FormatOutput = String
    
    func format(_ value: FormatInput) -> FormatOutput {
        let percent = value * 100
        return percent.formatted()
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self)
    }
    
    static func == (lhs: PercentWithoutCharacterFormatStyle, rhs: PercentWithoutCharacterFormatStyle) -> Bool {
        return true
    }
    
    
}
