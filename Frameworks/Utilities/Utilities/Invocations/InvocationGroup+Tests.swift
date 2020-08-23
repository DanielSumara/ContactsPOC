//
//  InvocationGroup+Tests.swift
//  UtilitiesTests
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

@testable import Utilities
import XCTest

final class InvocationGroup_Tests: XCTestCase {
    
    // MARK: - Properties
    
    private var sut = InvocationGroup<String>()
    
    // MARK: - Tests
    
    func test_GroupingRequests() {
        let methodWithoutArguments: ((String) -> Void) -> Void = { completion in completion("1") }
        let methodWithArgument: ((Int, (String) -> Void) -> Void) = { argument, completion in completion(argument.description) }
        
        sut.append(methodWithoutArguments)
        sut.append(methodWithArgument, with: 10)
        
        let expectation = XCTestExpectation(description: "Completion invoked")
        
        sut.invoke { result in
            expectation.fulfill()
            
            XCTAssertEqual(result, ["1", "10"])
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_ObjectIsReleased() {
        weak var reference = sut
        
        XCTAssertNotNil(reference)
        
        let methodWithoutArguments: ((String) -> Void) -> Void = { completion in completion("Some") }
        sut.append(methodWithoutArguments)
        sut = InvocationGroup()
        
        XCTAssertNil(reference)
    }
    
    func test_InvokeWithoutMethodsAdded() {
        let expectation = XCTestExpectation(description: "Completion invoked")
        
        sut.invoke { result in
            expectation.fulfill()
            
            XCTAssertEqual(result, [])
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
}

extension InvocationGroup_Tests {
    
    private enum Errors: Error, Equatable {
        
        case fake
        
    }
    
}
