//
//  AppCoordinator.swift
//  ContactsListDemo
//
//  Created by Daniel Sumara on 24/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import ContactsList
import DataRepository
import Foundation
import UIKit

final class AppCoordinator {
    
    // MARK: - Static properties
    
    static let instance = AppCoordinator()
    
    // MARK: - Properties
    
    private var mainFlow: ModuleFlow?
    private var window: UIWindow?
    
    // MARK: - Initializers
    
    init() {}
    
    // MARK: - Lifecycle
    
    func start(in window: UIWindow) {
        self.window = window
        
        let presenter = DefaultPresenter()
        window.rootViewController = presenter.viewController
        
        let contactsRepository = MockedContactsRepository()
        
        mainFlow = ContactListFlow(using: presenter, contactsRepository: contactsRepository)
        mainFlow?.start()
    }
    
}
