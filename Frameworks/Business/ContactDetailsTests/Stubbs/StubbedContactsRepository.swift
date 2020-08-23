//
//  StubbedContactsRepository.swift
//  ContactDetailsTests
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DataRepository
import DomainModels
import Foundation

final class StubbedContactsRepository: ContactsRepository, Stubbable {
    
    // MARK: - Stubs
    
    lazy var favoriteStub = stub(of: favorite)
    lazy var unfavoriteStub = stub(of: unfavorite)
    
    // MARK: - API
    
    func observeContacts<Observer: AnyObject>(on observer: Observer, updates: @escaping (Observer, Result<[Contact], ContactsRepositoryError>) -> Void) {
        fatalError("Not implemented")
    }
    
    func favorite(contact: Contact) {
        favoriteStub(contact)
    }
    
    func unfavorite(contact: Contact) {
        unfavoriteStub(contact)
    }
    
}
