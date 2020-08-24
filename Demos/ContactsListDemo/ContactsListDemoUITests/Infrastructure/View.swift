//
//  View.swift
//  ContactsListDemoUITests
//
//  Created by Daniel Sumara on 24/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import XCTest

class View: Element {
    
    // MARK: - API
    
    func activityIndicator(id: String) -> ActivityIndicator {
        ActivityIndicator(of: element.activityIndicators[id])
    }
    
    func label(id: String) -> Label {
        Label(of: element.staticTexts[id])
    }
    
    func view(id: String) -> View {
        View(of: element.otherElements[id])
    }
    
    func navigationBar(id: String) -> NavigationBar {
        NavigationBar(of: element.navigationBars[id])
    }
    
    func activityIndicator(_ id: String...) -> ActivityIndicator {
        activityIndicator(id: id.joined(separator: "_"))
    }
    
    func label(_ id: String...) -> Label {
        label(id: id.joined(separator: "_"))
    }
    
}
