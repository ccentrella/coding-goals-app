//
//  StringExtension.swift
//  CodingGoalsTests
//
//  Created by Christopher Centrella on 4/19/23.
//

import Foundation
@testable import CodingGoals
import XCTest

final class StringExtensionTest: XCTestCase {
    
    func testSingularize() throws {
        assert("Tests".singularize(count: 0) == "Tests", "string should be plural")
        assert("Tests".singularize(count: 1) == "Test", "string should be singular")
        assert("Tests".singularize(count: 2) == "Tests", "string should be plural")
    }
}
