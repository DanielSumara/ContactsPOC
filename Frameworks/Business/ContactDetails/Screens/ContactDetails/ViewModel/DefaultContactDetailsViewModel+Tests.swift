//
//  DefaultContactDetailsViewModel+Tests.swift
//  ContactDetailsTests
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

@testable import ContactDetails
import DomainModels
import Foundation
import XCTest

final class DefaultContactDetailsViewModel_Tests: XCTestCase {
    
    // MARK: - Properties
    
    private let model = StubbedContactDetailsModel()
    private let events = StubbedContactDetailsEvents()
    private let repository = StubbedImageRepository()
    
    private lazy var sut = DefaultContactDetailsViewModel(model: model, mapper: DefaultDomainToInterfaceMapper(), events: events, imageRepository: repository)
    
    // MARK: - Tests
    
    func test_ObservablesEmitsInitialValues() {
        var contactProjections: [ContactProjection] = []
        var isFavorites: [Bool] = []
        
        sut.contact.observe(on: self) { _, projection in contactProjections.append(projection) }
        sut.isFavorite.observe(on: self) { _, isFavorite in isFavorites.append(isFavorite) }
        
        XCTAssertEqual(contactProjections.count, 1)
        XCTAssertEqual(isFavorites, [false])
    }
    
    func test_ToggleFavoriteEmitsNewValue() {
        model.favoriteContactStub = { [weak model] in model?.contact.isFavorite = true }
        
        var isFavorites: [Bool] = []
        
        sut.isFavorite.observe(on: self) { _, isFavorite in isFavorites.append(isFavorite) }
        
        XCTAssertEqual(isFavorites, [false])
        
        sut.toggleFavoriteStatus()
        
        XCTAssertEqual(isFavorites, [false, true])
    }
    
    func test_InvokingEditContactEmitsEventWithContact() {
        var expectedContact: Contact?
        events.editContactStub = { contact in expectedContact = contact }
        
        sut.editContact()
        
        XCTAssertEqual(expectedContact, Contact.laurMantyla)
    }
    
}
