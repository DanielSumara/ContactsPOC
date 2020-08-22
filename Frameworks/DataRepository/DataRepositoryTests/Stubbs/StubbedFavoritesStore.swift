//
//  StubbedFavoritesStore.swift
//  DataRepositoryTests
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

@testable import DataRepository
import DomainModels
import Foundation

final class StubbedFavoritesStore: FavoritesStore, Stubbable {
    
    // MARK: - Stubbs
    
    lazy var containsStub = stub(of: contains)
    lazy var storeStub = stub(of: store)
    lazy var removeStub = stub(of: remove)
    
    // MARK: - API
    
    func contains(_ name: PersonName) -> Bool {
        containsStub(name)
    }
    
    func store(asFavorite: PersonName) {
        storeStub(asFavorite)
    }
    
    func remove(fromFavorites: PersonName) {
        removeStub(fromFavorites)
    }
    
}
