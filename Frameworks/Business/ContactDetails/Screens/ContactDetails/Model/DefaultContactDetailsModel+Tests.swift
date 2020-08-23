//
//  DefaultContactDetailsModel+Tests.swift
//  ContactDetailsTests
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

@testable import ContactDetails
import Foundation
import XCTest

final class DefaultContactDetailsModel_Tests: XCTestCase {
    
    // MARK: - Properties
    
    private let repository = StubbedContactsRepository()
    
    private lazy var sut = DefaultContactDetailsModel(contact: .laurMantyla, repository: repository)
    
    // MARK: - Tests
    
    func test_MarkingItemAsFavoritePassContactToRepositoryAndUpdatesModelInstance() {
        var invokeRepositoryUpdate = false
        repository.favoriteStub = { contact in invokeRepositoryUpdate = true }
        
        XCTAssertFalse(sut.contact.isFavorite)
        
        sut.favoriteContact()
        
        XCTAssertTrue(invokeRepositoryUpdate)
        XCTAssertTrue(sut.contact.isFavorite)
    }
    
    func test_UnmarkingItemAsFavoritePassContactToRepositoryAndUpdatesModelInstance() {
        var invokeRepositoryUpdate = false
        repository.favoriteStub = { contact in }
        repository.unfavoriteStub = { contact in invokeRepositoryUpdate = true }
        
        sut.favoriteContact()
        
        XCTAssertTrue(sut.contact.isFavorite)
        
        sut.unfavoriteContact()
        
        XCTAssertTrue(invokeRepositoryUpdate)
        XCTAssertFalse(sut.contact.isFavorite)
    }
    
}
