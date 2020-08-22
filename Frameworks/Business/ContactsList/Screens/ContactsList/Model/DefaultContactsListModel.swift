//
//  DefaultContactsListModel.swift
//  ContactsList
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DataRepository
import DomainModels
import Foundation

final class DefaultContactsListModel: ContactsListModel {
    
    // MARK: - Properties
    
    private let contactsRepository: ContactsRepository
    
    // MARK: - Initializers
    
    init(contactsRepository: ContactsRepository) {
        self.contactsRepository = contactsRepository
    }
    
    // MARK: - API
    
    func observeContacts<ObserverType: AnyObject>(on observer: ObserverType, updates: @escaping (ObserverType, Result<[Contact], ContactsRepositoryError>) -> Void) {
        contactsRepository.observeContacts(on: observer, updates: updates)
    }
    
}
