//
//  ContactsListScreenEvents.swift
//  ContactsList
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import Foundation
import Utilities

protocol ContactsListScreenEvents: AnyObject {
    
    // MARK: - Observables
    
    var errorOccurred: Observable<Error> { get }
    var contactTapped: Observable<Contact> { get }
    
}
