//
//  ContactDetailsFlow.swift
//  ContactDetails
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import DataRepository
import DomainModels
import Foundation
import UIKit

public final class ContactDetailsFlow: ModuleFlow {
    
    // MARK: - Properties
    
    private let contact: Contact
    private let contactRepository: ContactsRepository
    private let presenter: Presenter
    
    // MARK: - Initializers
    
    public init(presenter: Presenter, contact: Contact, contactRepository: ContactsRepository) {
        self.contact = contact
        self.contactRepository = contactRepository
        self.presenter = presenter
    }
    
    // MARK: - API
    
    public func start() {
        let screen = ContactDetailsScreen(contact: contact, repository: contactRepository)
        screen.events.editTapped.observe(on: self) { flow, contact in flow.edit(contact) }
        
        presenter.push(screen)
    }
    
    public func stop() {}
    
    // MARK: - Methods
    
    private func edit(_ contact: Contact) {}
    
}
