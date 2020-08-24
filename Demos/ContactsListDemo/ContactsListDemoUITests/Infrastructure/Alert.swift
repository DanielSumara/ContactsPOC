//
//  Alert.swift
//  ContactsListDemoUITests
//
//  Created by Daniel Sumara on 24/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import XCTest

final class Alert: Element {
    
    // MARK: - Getters
    
    var title: Label { Label(of: element.staticTexts.element(boundBy: 0)) }
    var subtitle: Label { Label(of: element.staticTexts.element(boundBy: 1)) }
    
    // MARK: - Lifecycle
    
    init(from application: XCUIApplication) {
        super.init(of: application.alerts["ALERT_POPOVER"])
    }
    
    // MARK: - API
    
    func button(title: String) -> Button {
        Button(of: element.buttons[title])
    }
    
}
