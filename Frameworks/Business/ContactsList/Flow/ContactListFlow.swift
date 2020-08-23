//
//  ContactListFlow.swift
//  ContactsList
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import ContactDetails
import DataRepository
import DomainModels
import Foundation
import UIKit

public final class ContactListFlow: ModuleFlow {
    
    // MARK: - Properties
    
    private let contactsRepository: ContactsRepository
    private let presenter: Presenter
    
    private var childFlow: ModuleFlow? {
        didSet {
            oldValue?.stop()
            childFlow?.start()
        }
    }
    
    // MARK: - Initializers
    
    public init(using presenter: Presenter, contactsRepository: ContactsRepository) {
        self.contactsRepository = contactsRepository
        self.presenter = presenter
    }
    
    // MARK: - API
    
    public func start() {
        let screen = ContactsListScreen(contactsRepository: contactsRepository)
        screen.events.contactTapped.observe(on: self) { flow, selectedContact in flow.showDetails(of: selectedContact) }
        screen.events.errorOccurred.observe(on: self) { flow, error in flow.show(error) }
        
        presenter.push(screen)
        
        presenter.observeAppearance(of: screen, on: self) { flow in flow.childFlow = nil }
    }
    
    public func stop() {}
    
    // MARK: - Methods
    
    private func showDetails(of contact: Contact) {
        childFlow = ContactDetailsFlow(presenter: presenter, contact: contact, contactRepository: contactsRepository)
    }
    
    private func show(_ error: Error) {
        let alertViewController = UIAlertController(title: "Error occurred", message: error.localizedDescription, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "Understand", style: .cancel, handler: nil))
        presenter.present(alertViewController)
    }
    
}
