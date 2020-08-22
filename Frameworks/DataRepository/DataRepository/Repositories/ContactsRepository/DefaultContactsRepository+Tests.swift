//
//  DefaultContactsRepository+Tests.swift
//  DataRepositoryTests
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

@testable import DataRepository
import DomainModels
import Foundation
import RestService
import XCTest

final class DefaultContactsRepository_Tests: XCTestCase {
    
    // MARK: - Properties
    
    private let contactsService = StubbedContactsService()
    private let favoritesStore = StubbedFavoritesStore()
    
    private lazy var sut = DefaultContactsRepository(restService: contactsService, favoritesStore: favoritesStore)
    
    // MARK: - Tests
    
    func test_ObserverReceiveErrorIfDataCannotBeLoaded() {
        contactsService.getContactsStub = { completion in completion(.failure(.invalidUrl)) }
        
        var updateInvoked = false
        sut.observeContacts(on: self) { _, result in
            updateInvoked = true
            
            switch result {
            case .success: XCTFail()
            case .failure: break
            }
        }
        
        XCTAssertTrue(updateInvoked)
    }
    
    func test_ObserverReceiveContactIfServiceReturnsOne() {
        contactsService.getContactsStub = { completion in completion(.success([.laurMantyla])) }
        favoritesStore.containsStub = { _ in false }
        
        var updateInvoked = false
        sut.observeContacts(on: self) { _, result in
            updateInvoked = true
            
            switch result {
            case let .success(contacts): XCTAssertEqual(contacts.count, 1)
            case .failure: XCTFail()
            }
        }
        
        XCTAssertTrue(updateInvoked)
    }
    
    func test_MakeContactFavoriteUpdatesContacts() throws {
        contactsService.getContactsStub = { completion in completion(.success([.laurMantyla])) }
        favoritesStore.storeStub = { _ in }
        favoritesStore.containsStub = { _ in false }
        
        var contact: Contact?
        sut.observeContacts(on: self) { _, result in
            switch result {
            case let .success(contacts): contact = contacts[0]
            case .failure: XCTFail()
            }
        }
        
        XCTAssertFalse(try XCTUnwrap(contact).isFavorite)
        favoritesStore.containsStub = { _ in true }
        sut.favorite(contact: try XCTUnwrap(contact))
        
        XCTAssertTrue(try XCTUnwrap(contact).isFavorite)
    }
    
    func test_FavoriteStatusIsRestoredAfterFetchData() {
        contactsService.getContactsStub = { completion in completion(.success([.laurMantyla])) }
    }
    
}
