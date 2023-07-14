//
//  GetGoalVerb.swift
//  CodingGoalsTests
//
//  Created by Christopher Centrella on 4/19/23.
//

import Foundation
@testable import CodingGoals
import XCTest

final class GetGoalVerbTest: XCTestCase {
    
    func testGetGoalVerb() {
        let pages: GoalType = .pages
        let books: GoalType = .books
        let videos: GoalType = .videos
        let functions: GoalType = .functions
        let articles: GoalType = .articles
        let apps: GoalType = .apps
        
        assert(pages.getVerb() == "Read", "wrong verb being returned for pages")
        assert(books.getVerb() == "Read", "wrong verb being returned for books")
        assert(videos.getVerb() == "Watch", "wrong verb being returned for videos")
        assert(functions.getVerb() == "Create", "wrong verb being returned for functions")
        assert(articles.getVerb() == "Read", "wrong verb being returned for articles")
        assert(apps.getVerb() == "Create", "wrong verb being returned for apps")
    }
}
