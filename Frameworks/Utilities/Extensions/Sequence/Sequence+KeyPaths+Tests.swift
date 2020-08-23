//
//  Sequence+KeyPaths+Tests.swift
//  ExtensionsTests
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

@testable import Extensions
import XCTest

final class Sequence_KeyPaths_Tests: XCTestCase {
    
    // MARK: - Tests
    
    func test_MapKeyPath() {
        let sut = [Model(number: 1),
                   Model(number: 2)]
        XCTAssertEqual(sut.map(\.number), [1, 2])
    }
    
}

private extension Sequence_KeyPaths_Tests {
    
    struct Model {
        
        let number: Int
        
    }
    
}
