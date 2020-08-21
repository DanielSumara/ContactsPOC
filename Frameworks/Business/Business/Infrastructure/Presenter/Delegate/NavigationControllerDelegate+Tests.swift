//
//  NavigationControllerDelegate+Tests.swift
//  BusinessTests
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

@testable import Business
import Foundation
import UIKit
import XCTest

final class NavigationControllerDelegate_Tests: XCTestCase {
    
    // MARK: - Properties
    
    private let sut = NavigationControllerDelegate()
    
    // MARK: - Tests
    
    func test_PassingViewControllerCausesDidShowClosureInvocation() {
        let controllerInstance = UIViewController()
        var didShowInvoked = false
        
        sut.didShow = { [controllerInstance] viewController in
            XCTAssertTrue(viewController === controllerInstance)
            didShowInvoked = true
        }
        
        sut.navigationController(UINavigationController(), didShow: controllerInstance, animated: true)
        
        XCTAssertTrue(didShowInvoked)
    }
    
}
