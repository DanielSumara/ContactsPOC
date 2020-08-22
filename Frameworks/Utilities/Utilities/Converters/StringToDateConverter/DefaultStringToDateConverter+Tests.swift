//
//  DefaultStringToDateConverter+Tests.swift
//  UtilitiesTests
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

@testable import Utilities
import XCTest

final class DefaultStringToDateConverter_Tests: XCTestCase {

    // MARK: - Properties

    private let sut = DefaultStringToDateConverter(timeZone: TimeZone(secondsFromGMT: 0))

    // MARK: - Tests
    
    // MARK: - ISO format
    
    func test_ISOFormat() {
        XCTAssertEqual(sut.date(from: "1970-01-01T00:00:00.000Z"), Date(timeIntervalSince1970: 0))
        XCTAssertEqual(sut.date(from: "2000-01-01T00:00:00.000Z"), Date(timeIntervalSince1970: 946684800))
        XCTAssertEqual(sut.date(from: "2000-01-01T03:15:00.000Z"), Date(timeIntervalSince1970: 946696500))
        XCTAssertEqual(sut.date(from: "2000-01-01T03:15:00.222Z"), Date(timeIntervalSince1970: 946696500.222))
    }
    
    // MARK: - ISO format without mili seconds
    
    func test_ISOFormatWithoutMiliSeconds() {
        XCTAssertEqual(sut.date(from: "1970-01-01T00:00:00Z"), Date(timeIntervalSince1970: 0))
        XCTAssertEqual(sut.date(from: "2000-01-01T00:00:00Z"), Date(timeIntervalSince1970: 946684800))
        XCTAssertEqual(sut.date(from: "2000-01-01T03:15:00Z"), Date(timeIntervalSince1970: 946696500))
    }
    
    // MARK: - Invalid input
    
    func test_InvalidInput() {
        XCTAssertNil(sut.date(from: ""))
        XCTAssertNil(sut.date(from: "today"))
        XCTAssertNil(sut.date(from: "2004-13-32"))
        XCTAssertNil(sut.date(from: "2000-01-01T25:15:00.000"))
        XCTAssertNil(sut.date(from: "2000-01-01T25:15:00"))
    }

}
