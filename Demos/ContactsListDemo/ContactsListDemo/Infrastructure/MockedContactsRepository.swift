//
//  MockedContactsRepository.swift
//  ContactsListDemo
//
//  Created by Daniel Sumara on 24/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DataRepository
import DomainModels
import Foundation
import Utilities

final class MockedContactsRepository: ContactsRepository {
    
    // MARK: - Properties
    
    private let emitter = EventEmitter<Result<[Contact], ContactsRepositoryError>>()
    
    private var didFetchData = false
    private var fetchedContacts: [Contact] = [] { didSet { emitter.notify(using: .success(fetchedContacts)) } }
    
    func observeContacts<Observer>(on observer: Observer, updates: @escaping (Observer, Result<[Contact], ContactsRepositoryError>) -> Void) where Observer: AnyObject {
        emitter.observe(on: observer, closure: updates)
        
        if didFetchData == false {
            didFetchData = true
            fetchData()
        }
    }
    
    func favorite(contact: Contact) {
        guard let index = fetchedContacts.firstIndex(where: { item in item.name == contact.name }) else { return assertionFailure() }
        fetchedContacts[index].isFavorite = true
    }
    
    func unfavorite(contact: Contact) {
        guard let index = fetchedContacts.firstIndex(where: { item in item.name == contact.name }) else { return assertionFailure() }
        fetchedContacts[index].isFavorite = false
    }
    
    // MARK: - Methods
    
    private func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            self?.fetchedContacts = [.laurMantyla, .marcielePereira, .miraPabst]
            self?.fetchedContacts[2].isFavorite = true
        }
    }
    
}
