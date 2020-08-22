//
//  UserDefaultsFavoritesStore+Tests.swift
//  DataRepositoryTests
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

@testable import DataRepository
import DomainModels
import Foundation
import XCTest

final class UserDefaultsFavoritesStore_Tests: XCTestCase {
    
    // MARK: - Properties
    
    private let userDefaults = UserDefaults(suiteName: #file)!
    
    private lazy var sut = UserDefaultsFavoritesStore(userDefaults: userDefaults)
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        userDefaults.removePersistentDomain(forName: #file)
    }
    
    // MARK: - Test
    
    func test_EmptyStore() {
        XCTAssertFalse(sut.contains(.laurMantyla))
        XCTAssertFalse(sut.contains(.marcielePereira))
    }
    
    func test_StoringOneAsFavorite() {
        XCTAssertFalse(sut.contains(.laurMantyla))
        
        sut.store(asFavorite: .laurMantyla)
        
        XCTAssertTrue(sut.contains(.laurMantyla))
        XCTAssertFalse(sut.contains(.marcielePereira))
    }
    
    func test_RemovingOneFromStore() {
        sut.store(asFavorite: .laurMantyla)
        
        XCTAssertTrue(sut.contains(.laurMantyla))
        
        sut.remove(fromFavorites: .laurMantyla)
        
        XCTAssertFalse(sut.contains(.laurMantyla))
    }
    
}
