//
//  InvocationRetainer+Tests.swift
//  UtilitiesTests
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

@testable import Utilities
import XCTest

final class InvocationRetainer_Tests: XCTestCase {
    
    // MARK: - Properties
    
    private let sut = InvocationRetainer()
    
    // MARK: - Tests
    
    func test_IsRetainObjects() throws {
        var object: NSObject? = NSObject()
        weak var reference = object
        
        XCTAssertNotNil(reference)
        
        let uuid = UUID()
        sut.retain(try XCTUnwrap(object), for: uuid)
        
        object = nil
        XCTAssertNotNil(reference)
        
        sut.releaseObject(with: uuid)
        
        XCTAssertNil(reference)
    }
    
}
