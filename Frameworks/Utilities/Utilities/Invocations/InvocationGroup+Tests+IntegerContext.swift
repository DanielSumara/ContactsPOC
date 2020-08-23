//
//  InvocationGroup+Tests+IntegerContext.swift
//  UtilitiesTests
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

@testable import Utilities
import XCTest

final class InvocationGroup_Tests_IntegerContext: XCTestCase {
    
    // MARK: - Properties
    
    private var sut = InvocationGroup<Int>()
    
    // MARK: - Tests
    
    func test_GroupingRequests() {
        let methodWithoutArguments: ((Int) -> Void) -> Void = { completion in completion(1) }
        let methodWithArgument: ((Int, (Int) -> Void) -> Void) = { argument, completion in completion(argument) }
        
        sut.append(methodWithoutArguments)
        sut.append(methodWithArgument, with: 10)
        
        let expectation = XCTestExpectation(description: "Completion invoked")
        
        sut.invoke { result in
            expectation.fulfill()
            
            XCTAssertEqual(result, [1, 10])
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
}
