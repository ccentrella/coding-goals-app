//
//  EntriesCompletedMessage.swift
//  CodingGoalsTests
//
//  Created by Christopher Centrella on 4/19/23.
//

import Foundation
@testable import CodingGoals
import XCTest

final class EntriesCmpletedMessageTest: XCTest {
    
    func testEntriesCompletedMessage() {
        let pages: GoalType = .pages
        let books: GoalType = .books
        let videos: GoalType = .videos
        let functions: GoalType = .functions
        let articles: GoalType = .articles
        let apps: GoalType = .apps
        
        assert(pages.getEntriesCompletedMessage() == "pages read", "wrong entries completed message being returned for pages")
        assert(books.getEntriesCompletedMessage() == "books read", "wrong entries completed message being returned for books")
        assert(videos.getEntriesCompletedMessage() == "videos watched", "wrong entries completed message being returned for videos")
        assert(functions.getEntriesCompletedMessage() == "functions created", "wrong entries completed message being returned for functions")
        assert(articles.getEntriesCompletedMessage() == "articles read", "wrong entries completed message being returned for articles")
        assert(apps.getEntriesCompletedMessage() == "apps created", "wrong entries completed message being returned for apps")
    }
}
