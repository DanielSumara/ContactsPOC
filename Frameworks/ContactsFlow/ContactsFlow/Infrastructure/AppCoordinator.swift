//
//  AppCoordinator.swift
//  ContactsFlow
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import ContactsList
import DataRepository
import Foundation
import RestService
import UIKit

public final class AppCoordinator {
    
    // MARK: - Static properties
    
    public static let instance = AppCoordinator()
    
    // MARK: - Properties
    
    private var mainFlow: ModuleFlow?
    private var window: UIWindow?
    
    // MARK: - Initializers
    
    init() {}
    
    // MARK: - Lifecycle
    
    public func start(in window: UIWindow) {
        self.window = window
        
        let presenter = DefaultPresenter()
        window.rootViewController = presenter.viewController
        
        let contactsService = DefaultContactsService()
        let contactsRepository = DefaultContactsRepository(restService: contactsService)
        
        mainFlow = ContactListFlow(using: presenter, contactsRepository: contactsRepository)
        mainFlow?.start()
    }
    
}
