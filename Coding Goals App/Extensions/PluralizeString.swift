//
//  PluralizeString.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/11/23.
//

import Foundation

extension String {
    
    func pluralize(count: Int) -> String {
        return count == 1 ? self.dropLast(1).description : self
    }
}
