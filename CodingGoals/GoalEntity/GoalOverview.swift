//
//  GoalOverview.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/22/23.
//

import Foundation

struct GoalOverview: Codable, Hashable {
    var description: String = ""
    var type: GoalType = .pages
    var length: Int = 5
    var deadline: NullableDate = NullableDate()
}
