//
//  ContactDetailsScreen.swift
//  ContactsListDemoUITests
//
//  Created by Daniel Sumara on 24/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import XCTest

final class ContactDetailsScreen: View {
    
    // MARK: - Getters
    
    // MARK: - Properties
    
    private let application: XCUIApplication
    private let id: String = "ContactDetailsView"
    private let testCase: XCTestCase
    
    // MARK: - Lifecycle
    
    init(from application: XCUIApplication, for testCase: XCTestCase) {
        self.application = application
        self.testCase = testCase
        super.init(of: application.scrollViews[id])
    }
    
}
