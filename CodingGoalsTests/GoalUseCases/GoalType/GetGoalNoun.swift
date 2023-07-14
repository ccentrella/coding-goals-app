//
//  GetGoalNoun.swift
//  CodingGoalsTests
//
//  Created by Christopher Centrella on 4/19/23.
//

import Foundation
@testable import CodingGoals
import XCTest
import SwiftUI

final class GetGoalNounTest: XCTestCase {
    
    func testGetGoalNoun() {
        let pages: GoalType = .pages
        let books: GoalType = .books
        let videos: GoalType = .videos
        let functions: GoalType = .functions
        let articles: GoalType = .articles
        let apps: GoalType = .apps
        
        assert(pages.getNoun(count: 5) == "pages", "wrong noun being returned for pages")
        assert(books.getNoun(count: 5) == "pages", "wrong noun being returned for books")
        assert(videos.getNoun(count: 5) == "videos", "wrong noun being returned for videos")
        assert(functions.getNoun(count: 5) == "functions", "wrong noun being returned for functions")
        assert(articles.getNoun(count: 5) == "pages", "wrong noun being returned for articles")
        assert(apps.getNoun(count: 5) == "apps", "wrong noun being returned for apps")
    }
}
