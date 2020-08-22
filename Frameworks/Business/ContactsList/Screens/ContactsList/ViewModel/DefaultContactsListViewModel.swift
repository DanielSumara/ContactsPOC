//
//  DefaultContactsListViewModel.swift
//  ContactsList
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import Utilities

final class DefaultContactsListViewModel: ContactsListViewModel {
    
    // MARK: - Observables
    
    let narrowedToFavorites: Observable<Bool>
    let content: Observable<ListContent>
    
    // MARK: - Properties
    
    private let _narrowedToFavorites = ValueEmitter(value: false)
    private let _content = ValueEmitter(value: ListContent.loading)
    
    // MARK: - Initializers
    
    init(model: Any) {
        narrowedToFavorites = _narrowedToFavorites.asObservable()
        content = _content.asObservable()
    }
    
    func toggleFavorites() {
        
    }
    
}
