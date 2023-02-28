//
//  InspirationalMessage.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/25/23.
//

import Foundation
import SwiftUI

class InspirationalMessage {
    
    private static let name = "Frank"
    private static let affirmativeMessages: [String] = [
            "You're crushing it, \(name)! Keep up the amazing work!",
            "So proud of you, \(name)! Your dedication is paying off.",
            "You've got this, \(name)! Keep pushing through, and you'll achieve your goals.",
            "Fantastic job, \(name)! Don't give up now.",
            "Believe in yourself, \(name)! You have what it takes to succeed.",
            "Making amazing progress, \(name)! Keep up the great work.",
            "You inspire me, \(name)! Your determination is truly admirable.",
            "Rooting for you, \(name)! Keep striving for excellence.",
            "Outstanding job, \(name)! Keep up the momentum.",
            "Capable of greatness, \(name)! Keep pushing yourself to new heights."
        ]
    private static let supportiveMessages: [String] = [
        "You're doing great, \(name)! Remember to be kind to yourself on this journey.",
        "Believe in yourself, \(name)! You are stronger than you know, and you will overcome this.",
        "Keep going, \(name)! Every small step counts towards progress.",
        "You are not alone, \(name)! Reach out for help and support when you need it.",
        "Don't give up, \(name)! You have the strength to overcome any challenge.",
        "Remember how far you've come, \(name)! You are capable of achieving anything you set your mind to.",
        "You can count on support and encouragement, \(name)! Reach out when you need it.",
        "You are worthy of love and happiness, \(name)! Keep working towards your goals, and you will find them.",
        "It's okay to struggle, \(name)! Allow yourself to take a break and recharge when you need it.",
        "You are amazing, \(name)! Keep pushing forward, and you will emerge stronger and more resilient than ever before."
    ]

    static func getInspirationalMessage(goal: Goal) -> String {
        let score = getScore()
        return score < 0.5 ? supportiveMessage() : affirmativeMessage()
    }
    
    // TODO: Implement this correctly based on progress and deadline
    private static func getScore() -> Double {
        return 1
    }
    
    private static func affirmativeMessage() -> String {
        var randomMessageIndex = Int.random(in: 0..<affirmativeMessages.count)
        return affirmativeMessages[randomMessageIndex]
    }
    
    private static func supportiveMessage() -> String {
        var randomMessageIndex = Int.random(in: 0..<supportiveMessages.count)
        return supportiveMessages[randomMessageIndex]
    }
}
