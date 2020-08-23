//
//  DefaultContactDetailsModel.swift
//  ContactDetails
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DataRepository
import DomainModels
import Foundation

final class DefaultContactDetailsModel: ContactDetailsModel {
    
    // MARK: - Properties
    
    private(set) var contact: Contact
    
    private let repository: ContactsRepository
    
    // MARK: - Initializers
    
    init(contact: Contact, repository: ContactsRepository) {
        self.contact = contact
        self.repository = repository
    }
    
    // MARK: - API
    
    func favoriteContact() {
        repository.favorite(contact: contact)
        contact.isFavorite = true
    }
    
    func unfavoriteContact() {
        repository.unfavorite(contact: contact)
        contact.isFavorite = false
    }
    
}
