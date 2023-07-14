//
//  EntriesCompletedMessage.swift
//  CodingGoalsTests
//
//  Created by Christopher Centrella on 4/19/23.
//

import Foundation
@testable import CodingGoals
import XCTest

final class EntriesCmpletedMessageTest: XCTestCase {
    
    func testEntriesCompletedMessage() {
        let pages: GoalType = .pages
        let books: GoalType = .books
        let videos: GoalType = .videos
        let functions: GoalType = .functions
        let articles: GoalType = .articles
        let apps: GoalType = .apps
        
        assert(pages.getEntriesCompletedMessage() == "Pages read", "wrong entries completed message being returned for pages")
        assert(books.getEntriesCompletedMessage() == "Pages read", "wrong entries completed message being returned for books")
        assert(videos.getEntriesCompletedMessage() == "Videos watched", "wrong entries completed message being returned for videos")
        assert(functions.getEntriesCompletedMessage() == "Functions created", "wrong entries completed message being returned for functions")
        assert(articles.getEntriesCompletedMessage() == "Pages read", "wrong entries completed message being returned for articles")
        assert(apps.getEntriesCompletedMessage() == "Apps created", "wrong entries completed message being returned for apps")
    }
}
