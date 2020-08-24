//
//  Button.swift
//  ContactsListDemoUITests
//
//  Created by Daniel Sumara on 24/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import XCTest

final class Button: Element {
    
    // MARK: - Properties
    
    var isEnabled: Bool { element.isEnabled }
    var isSelected: Bool { element.isSelected }
    
    // MARK: - API
    
    func tap() {
        element.tap()
    }
    
}
