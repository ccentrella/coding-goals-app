//
//  ImageExtension.swift
//  CodingGoalsTests
//
//  Created by Christopher Centrella on 4/19/23.
//

import Foundation
import XCTest
import SwiftUI
@testable import CodingGoals

final class ImageExtensionTest: XCTestCase {
    
    func testGoalTypeImageConstructor() throws {
        
        let pages = Image(goalType: .pages)
        let books = Image(goalType: .books)
        let videos = Image(goalType: .videos)
        let functions = Image(goalType: .functions)
        let articles = Image(goalType: .articles)
        let apps = Image(goalType: .apps)
        
        assert(pages == Image(systemName: "doc.plaintext"), "wrong system image being returned for pages")
        assert(books == Image(systemName: "book"), "wrong system image being returned for books")
        assert(videos == Image(systemName: "video"), "wrong system image being returned for videos")
        assert(functions == Image(systemName: "function"), "wrong system image being returned for functions")
        assert(articles == Image(systemName: "newspaper"), "wrong system image being returned for articles")
        assert(apps == Image(systemName: "apps.iphone"), "wrong system image being returned for apps")

    }
}
