//
//  ContactsListScreen.swift
//  ContactsListDemoUITests
//
//  Created by Daniel Sumara on 24/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import XCTest

final class ContactsListScreen: View {
    
    // MARK: - Getters
    
    var navigationBar: NavigationBar { NavigationBar(of: application.navigationBars["NavigationBar"]) }
    
    var favoriteButton: Button { Button(of: navigationBar.element.buttons["ContactsListView_FavoriteButton"]) }
    
    var cellsCount: Int { element.cells.count }

    var loadingCell: LoadingCell { LoadingCell(of: element.cells["LoadingCell"]) }
    
    var firstContactCell: ContactCell { ContactCell(of: element.cells["ContactCell_Mantyla"]) }
    var secondContactCell: ContactCell { ContactCell(of: element.cells["ContactCell_Pereira"]) }
    var thirdContactCell: ContactCell { ContactCell(of: element.cells["ContactCell_Pabst"]) }
    
    var detailsScreen: ContactDetailsScreen { ContactDetailsScreen(from: application, for: testCase) }
    
    // MARK: - Properties
    
    private let application: XCUIApplication
    private let id: String = "ContactsListView"
    private let testCase: XCTestCase
    
    // MARK: - Lifecycle
    
    init(from application: XCUIApplication, for testCase: XCTestCase) {
        self.application = application
        self.testCase = testCase
        super.init(of: application.tables[id])
    }
    
}

extension ContactsListScreen {
    
    final class LoadingCell: View {
        
        // MARK: - Getters
        
        var activityIndicator: ActivityIndicator { activityIndicator("LoadingCell", "ActivityIndicator") }
        var descriptionLabel: Label { label("LoadingCell", "DescriptionLabel") }
        
    }
    
    final class ContactCell: View {
        
        // MARK: - Getters
        
        var nameLabel: Label { label("ContactCell", "NameLabel") }
        var nationalityLabel: Label { label("ContactCell", "NameLabel") }
        
        // MARK: - API
        
        func tap() {
            element.tap()
        }
        
    }
    
}
