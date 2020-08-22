//
//  UserDefaultsFavoritesStore.swift
//  DataRepository
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import Foundation

final class UserDefaultsFavoritesStore: FavoritesStore {
    
    // MARK: - Properties
    
    private let userDefaults: UserDefaults 
    
    // MARK: - Initializers
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    // MARK: - API
    
    func contains(_ name: PersonName) -> Bool {
        userDefaults.bool(forKey: key(for: name))
    }
    
    func store(asFavorite name: PersonName) {
        userDefaults.set(true, forKey: key(for: name))
    }
    
    func remove(fromFavorites name: PersonName) {
        userDefaults.removeObject(forKey: key(for: name))
    }
    
    // MARK: - Methods
    
    private func key(for name: PersonName) -> String {
        "FavoritesStore|\(name.last)-\(name.first)"
    }
    
}
