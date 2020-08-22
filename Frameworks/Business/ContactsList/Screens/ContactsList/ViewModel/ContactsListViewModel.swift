//
//  ContactsListViewModel.swift
//  ContactsList
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import Utilities

protocol ContactsListViewModel: AnyObject {
    
    // MARK: - Observable
    
    var content: Observable<ListContent> { get }
    var narrowedToFavorites: Observable<Bool> { get }
    
    // MARK: - API
    
    func getContacts()
    func toggleFavorites()
    
    func select(_ contact: ContactProjection)
    
    func fetchAvatarsFor(contacts: [ContactProjection])
    
}
