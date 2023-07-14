//
//  GetGoalColor.swift
//  CodingGoalsTests
//
//  Created by Christopher Centrella on 4/19/23.
//

import Foundation
@testable import CodingGoals
import XCTest
import SwiftUI

final class GetGoalColorTest: XCTestCase {
    
    func testGetGoalColor() {
        let pages: GoalType = .pages
        let books: GoalType = .books
        let videos: GoalType = .videos
        let functions: GoalType = .functions
        let articles: GoalType = .articles
        let apps: GoalType = .apps
        
        assert(pages.getColor() == Color.pink, "wrong color being returned for pages")
        assert(books.getColor() == Color.teal, "wrong color being returned for books")
        assert(videos.getColor() == Color.indigo, "wrong color being returned for videos")
        assert(functions.getColor() == Color.orange, "wrong color being returned for functions")
        assert(articles.getColor() == Color.brown, "wrong color being returned for articles")
        assert(apps.getColor() == Color.purple, "wrong color being returned for apps")
    }
}
