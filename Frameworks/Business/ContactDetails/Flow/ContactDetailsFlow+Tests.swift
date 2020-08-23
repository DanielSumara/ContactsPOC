//
//  ContactDetailsFlow+Tests.swift
//  ContactDetailsTests
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
@testable import ContactDetails
import Foundation
import XCTest

final class ContactDetailsFlow_Tests: XCTestCase {
    
    // MARK: - Properties
    
    private let imagesRepository = StubbedImageRepository()
    private let presenter = StubbedPresenter()
    private let repository = StubbedContactsRepository()
    
    private lazy var sut = ContactDetailsFlow(presenter: presenter, contact: .laurMantyla, contactRepository: repository, imagesRepository: imagesRepository)
    
    // MARK: - Tests
    
    func test_StartMethodPushScreenToNavigationStack() {
        var expectedScreen: Screen?
        presenter.pushScreenStub = { screen in expectedScreen = screen }
        
        sut.start()
        
        XCTAssertNotNil(expectedScreen)
    }
    
    func test_TappingOnContactPresentScreenModally() throws {
        var expectedScreen: Screen?
        presenter.pushScreenStub = { screen in expectedScreen = screen }
        
        sut.start()
        
        let detailsScreen = try XCTUnwrap(expectedScreen as? ContactDetailsScreen)
        let events = try XCTUnwrap(detailsScreen.events as? DefaultContactDetailsEvents)
        
        var expectedViewController: UIViewController?
        presenter.presentViewControllerStub = { viewController in expectedViewController = viewController }
        
        events.edit(.laurMantyla)
        
        XCTAssertNotNil(expectedViewController)
        XCTAssertTrue(expectedViewController is UINavigationController)
    }
    
}
