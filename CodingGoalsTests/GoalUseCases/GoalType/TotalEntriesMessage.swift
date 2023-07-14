//
//  TotalEntriesMessage.swift
//  CodingGoalsTests
//
//  Created by Christopher Centrella on 4/19/23.
//

import Foundation
@testable import CodingGoals
import XCTest

final class TotalEntriesMessageTest: XCTest {
    
    func testTotalEntriesMessage() {
        let pages: GoalType = .pages
        let books: GoalType = .books
        let videos: GoalType = .videos
        let functions: GoalType = .functions
        let articles: GoalType = .articles
        let apps: GoalType = .apps
        
        assert(pages.getTotalEntriesMessage() == "Total pages", "wrong total entries message being returned for pages")
        assert(books.getTotalEntriesMessage() == "Total books", "wrong total entries message being returned for books")
        assert(videos.getTotalEntriesMessage() == "Total videos", "wrong total entries message being returned for videos")
        assert(functions.getTotalEntriesMessage() == "Total functions", "wrong total entries message being returned for functions")
        assert(articles.getTotalEntriesMessage() == "Total articles", "wrong total entries message being returned for articles")
        assert(apps.getTotalEntriesMessage() == "Total apps", "wrong total entries message being returned for apps")
    }
}
