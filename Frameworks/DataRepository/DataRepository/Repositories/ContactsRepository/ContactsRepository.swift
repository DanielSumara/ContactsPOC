//
//  ContactsRepositoryError.swift
//  DataRepository
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels

public protocol ContactsRepository: AnyObject {
    
    func observeContacts<Observer: AnyObject>(on observer: Observer, updates: @escaping (Observer, Result<[Contact], ContactsRepositoryError>) -> Void)
    
    func favorite(contact: Contact)
    func unfavorite(contact: Contact)
    
}
