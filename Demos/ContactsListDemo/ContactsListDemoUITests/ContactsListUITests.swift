//
//  ContactsListDemoUITests.swift
//  ContactsListDemoUITests
//
//  Created by Daniel Sumara on 24/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import XCTest

final class ContactsListUITests: XCTestCase {
    
    // MARK: - Getters
    
    private var sut: ContactsListScreen { ContactsListScreen(from: app, for: self) }
    
    // MARK: - Properties
    
    private var app: XCUIApplication!
    
    // MARK: - Lifecycle

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }
    
    // MARK: - Tests
    
    func test_NavigationBarIsVisibleWithTitle() {
        XCTAssertEqual(sut.navigationBar.title, "Contacts")
        XCTAssertEqual(sut.navigationBar.buttonsCount, 0)
    }
    
    func test_ActivityIndicatorWithDescriptionIsVisibleWhenAppStarts() {
        XCTAssertEqual(sut.cellsCount, 1)
        XCTAssertTrue(sut.loadingCell.exists)
        XCTAssertTrue(sut.loadingCell.activityIndicator.exists)
        XCTAssertEqual(sut.loadingCell.descriptionLabel.text, "Loading contacts...")
    }
    
    func test_WhenContactsCellAppearsFavoriteButtonsAppearInNavigationBar() {
        sut.firstContactCell.waitToAppear(for: self)
        
        XCTAssertEqual(sut.cellsCount, 3)
        
        XCTAssertEqual(sut.firstContactCell.nameLabel.text, "Lauri Mantyla")
        XCTAssertEqual(sut.secondContactCell.nameLabel.text, "Marciele Pereira")
        XCTAssertEqual(sut.thirdContactCell.nameLabel.text, "Mira Pabst")
        
        XCTAssertTrue(sut.favoriteButton.exists)
        XCTAssertTrue(sut.favoriteButton.isEnabled)
        
        XCTAssertFalse(sut.favoriteButton.isSelected)
    }
    
    func test_TappingOnFavoritesButtonFilterContacts() {
        sut.firstContactCell.waitToAppear(for: self)
        
        XCTAssertEqual(sut.cellsCount, 3)
        
        sut.favoriteButton.tap()
        
        XCTAssertEqual(sut.cellsCount, 1)
        XCTAssertFalse(sut.firstContactCell.exists)
        XCTAssertFalse(sut.secondContactCell.exists)
        XCTAssertTrue(sut.thirdContactCell.exists)
    }
    
    func test_UnselectingFavoriteButtonShowAllContacts() {
        sut.firstContactCell.waitToAppear(for: self)
        
        sut.favoriteButton.tap()
        sut.favoriteButton.tap()
        
        XCTAssertEqual(sut.cellsCount, 3)
    }
    
    func test_TappingContactCausesDetailsToAppear() {
        sut.firstContactCell.waitToAppear(for: self)
        sut.secondContactCell.tap()
        
        sut.detailsScreen.waitToAppear(for: self)
        
        XCTAssertTrue(sut.detailsScreen.exists)
    }
    
    

}
