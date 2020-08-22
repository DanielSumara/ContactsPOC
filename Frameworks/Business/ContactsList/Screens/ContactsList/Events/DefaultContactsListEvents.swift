//
//  DefaultContactsListEvents.swift
//  ContactsList
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import Foundation
import Utilities

final class DefaultContactsListEvents: ContactsListEvents, ContactsListScreenEvents {
    
    // MARK: - Observables
    
    let contactTapped: Observable<Contact>
    let errorOccurred: Observable<Error>
    
    // MARK: - Properties
    
    private let _contactTapped = EventEmitter<Contact>()
    private let _errorOccurred = EventEmitter<Error>()
    
    // MARK: - Initializers
    
    init() {
        contactTapped = _contactTapped.asObservable()
        errorOccurred = _errorOccurred.asObservable()
    }
    
    // MARK: - API
    
    func report(_ error: Error) {
        _errorOccurred.notify(using: error)
    }
    
    func presentDetails(of contact: Contact) {
        _contactTapped.notify(using: contact)
    }
    
}
