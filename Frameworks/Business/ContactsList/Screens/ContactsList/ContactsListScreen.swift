//
//  ContactsListScreen.swift
//  ContactsList
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import DataRepository
import Foundation
import UIKit

final class ContactsListScreen: Screen {
    
    // MARK: - Properties
    
    let viewController: UIViewController
    
    // MARK: - Initializers
    
    init(contactsRepository: ContactsRepository) {
        let model = DefaultContactsListModel(contactsRepository: contactsRepository)
        let viewModel = DefaultContactsListViewModel(model: model)
        viewController = ContactsListViewController(viewModel: viewModel)
    }
    
}
