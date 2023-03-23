//
//  NullableDate.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/26/23.
//
//  Created to allow an optional date. We could use Optional<Date>,
//  but this allows us to bind to the inner data value.
//

import Foundation

struct NullableDate: Codable, Hashable {
    var hasValue: Bool = false
    var date: Date = Date()
}
