//
//  Element.swift
//  ContactsListDemoUITests
//
//  Created by Daniel Sumara on 24/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import XCTest

class Element {
    
    // MARK: - Properties
    
    let element: XCUIElement
    
    var exists: Bool { return element.exists }
    
    // MARK: - Lifecycle
    
    init(of element: XCUIElement) {
        self.element = element
    }
    
    init(from copy: Element) {
        element = copy.element
    }
    
    // MARK: - API
    
    func waitToAppear(for testCase: XCTestCase, timeout: TimeInterval = 1, file: String = #file, line: Int = #line) {
        guard element.waitForExistence(timeout: timeout) else {
            let message = "Failed to find \(element) after \(timeout) seconds."
            testCase.recordFailure(withDescription: message, inFile: file, atLine: line, expected: true)
            return
        }
    }
    
}
