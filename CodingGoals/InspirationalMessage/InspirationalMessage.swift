//
//  InspirationalMessage.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/21/23.
//

import Foundation

protocol InspirationalMessage {
    
    static func getInspirationalMessage(goal: Goal) -> String
    static func getScore() -> Double
    static func affirmativeMessage() -> String
    static func supportiveMessage() -> String
}
