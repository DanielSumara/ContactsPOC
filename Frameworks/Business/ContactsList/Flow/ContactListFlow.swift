//
//  ContactListFlow.swift
//  ContactsList
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import DataRepository
import DomainModels
import Foundation
import UIKit

public final class ContactListFlow: ModuleFlow {
    
    // MARK: - Properties
    
    private let contactsRepository: ContactsRepository
    private let presenter: Presenter
    
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
    }
    
    public func stop() {}
    
    // MARK: - Methods
    
    private func showDetails(of contact: Contact) {
        
    }
    
    private func show(_ error: Error) {
        let alertViewController = UIAlertController(title: "Error occurred", message: error.localizedDescription, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "Understand", style: .cancel, handler: nil))
        presenter.present(alertViewController)
    }
    
}
