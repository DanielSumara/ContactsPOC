//
//  DefaultContactDetailsEvents.swift
//  ContactDetails
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import Foundation
import Utilities

final class DefaultContactDetailsEvents: ContactDetailsEvents, ContactDetailsScreenEvents {
    
    // MARK: - Observables
    
    let editTapped: Observable<Contact>
    
    // MARK: - Properties
    
    private let _editTapped = EventEmitter<Contact>()
    
    // MARK: - Initializers
    
    init() {
        editTapped = _editTapped.asObservable()
    }
    
    // MARK: - API
    
    func edit(_ contact: Contact) {
        _editTapped.notify(using: contact)
    }
    
}
