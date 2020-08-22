//
//  FavoritesStore.swift
//  DataRepository
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import Foundation

protocol FavoritesStore: AnyObject {
    
    func contains(_ name: PersonName) -> Bool
    
    func store(asFavorite: PersonName)
    func remove(fromFavorites: PersonName)
    
}
