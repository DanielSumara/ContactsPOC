//
//  DefaultContactsRepositoryError.swift
//  DataRepository
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import RestService
import RestModels
import Utilities

public final class DefaultContactsRepository: ContactsRepository {
    
    // MARK: - Properties
    
    private let restService: ContactsService
    
    private let favoritesStore: FavoritesStore
    private let mapper: TransportToDomainMapper
    
    private let emitter = Emitter<Result<[Contact], ContactsRepositoryError>>()
    
    private var state = State.cold
    private var fetchedContacts: [Contact] = [] { didSet { emitter.notify(using: .success(fetchedContacts)) } }
    
    // MARK: - Initializers
    
    public convenience init(restService: ContactsService) {
        self.init(restService: restService, favoritesStore: UserDefaultsFavoritesStore())
    }
    
    init(restService: ContactsService, favoritesStore: FavoritesStore) {
        self.favoritesStore = favoritesStore
        self.restService = restService
        
        mapper = DefaultTransportToDomainMapper()
    }
    
    // MARK: - API
    
    public func observeContacts<Observer: AnyObject>(on observer: Observer, updates: @escaping (Observer, Result<[Contact], ContactsRepositoryError>) -> Void) {
        emitter.observe(on: observer, closure: updates)
        
        if state == .cold {
            fetchData()
        }
    }
    
    public func favorite(contact: Contact) {
        guard let index = fetchedContacts.firstIndex(where: { item in item.name == contact.name }) else { return assertionFailure() }
        favoritesStore.store(asFavorite: contact.name)
        fetchedContacts[index].isFavorite = favoritesStore.contains(contact.name)
    }
    
    public func unfavorite(contact: Contact) {
        guard let index = fetchedContacts.firstIndex(where: { item in item.name == contact.name }) else { return assertionFailure() }
        favoritesStore.remove(fromFavorites: contact.name)
        fetchedContacts[index].isFavorite = favoritesStore.contains(contact.name)
    }
    
    // MARK: - Methods
    
    private func fetchData() {
        state = .fetchingData
        
        restService.getContacts { [weak self] result in
            self?.state = .warm
            
            switch result {
            case let .failure(error): self?.emitter.notify(using: .failure(.service(error)))
            case let .success(contacts): self?.cache(contacts)
            }
        }
    }
    
    private func cache(_ contacts: [ContactDTO]) {
        var mappedContacts = contacts.map(mapper.contact(from:))
        for index in 0 ..< mappedContacts.count {
            mappedContacts[index].isFavorite = favoritesStore.contains(mappedContacts[index].name)
        }
        
        fetchedContacts = mappedContacts
    }
    
}

extension DefaultContactsRepository {
    
    enum State {
        
        case cold
        case fetchingData
        case warm
        
    }
    
}
