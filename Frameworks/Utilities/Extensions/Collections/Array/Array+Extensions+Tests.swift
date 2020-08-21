//
//  Array+Extensions+Tests.swift
//  ExtensionsTests
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

@testable import Extensions
import XCTest

final class Array_Extensions_Tests: XCTestCase {
    
    // MARK: - Tests
    
    func test_IsNotEmptyReturnsFalseForEmptyArrays() {
        XCTAssertFalse([Int]().isNotEmpty)
        XCTAssertFalse([String]().isNotEmpty)
    }
    
    func test_IsNotEmptyReturnsTrueForArraysWithItems() {
        XCTAssertTrue([1, 2].isNotEmpty)
        XCTAssertTrue(["Some"].isNotEmpty)
    }

}
