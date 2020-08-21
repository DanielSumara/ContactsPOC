//
//  ContactListFlow.swift
//  ContactsList
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import Foundation
import UIKit

public final class ContactListFlow: ModuleFlow {
    
    // MARK: - Properties
    
    private let presenter: Presenter
    
    // MARK: - Initializers
    
    public init(using presenter: Presenter) {
        self.presenter = presenter
    }
    
    // MARK: - API
    
    public func start() {
        let screen = ContactsListScreen()
        presenter.push(screen)
    }
    
    public func stop() {}
    
}
