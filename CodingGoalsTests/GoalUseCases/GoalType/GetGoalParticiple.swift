//
//  GetGoalParticiple.swift
//  CodingGoalsTests
//
//  Created by Christopher Centrella on 4/19/23.
//

import Foundation
@testable import CodingGoals
import XCTest

final class GetGoalParticipleTest: XCTest {
    
    func testGetGoalParticiple() {
        let pages: GoalType = .pages
        let books: GoalType = .books
        let videos: GoalType = .videos
        let functions: GoalType = .functions
        let articles: GoalType = .articles
        let apps: GoalType = .apps
        
        assert(pages.getParticiple() == "read", "wrong participle being returned for pages")
        assert(books.getParticiple() == "read", "wrong participle being returned for books")
        assert(videos.getParticiple() == "watched", "wrong participle being returned for videos")
        assert(functions.getParticiple() == "created", "wrong participle being returned for functions")
        assert(articles.getParticiple() == "read", "wrong participle being returned for articles")
        assert(apps.getParticiple() == "created", "wrong participle being returned for apps")
    }
}
