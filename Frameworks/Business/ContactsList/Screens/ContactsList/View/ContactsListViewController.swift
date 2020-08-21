//
//  ContactsListViewController.swift
//  ContactsList
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

final class ContactsListViewController: UIViewController {
    
    // MARK: - Properties
    
    private let contentView = ContentView()
    
    // MARK: - Initializers
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contacts"
        navigationItem.largeTitleDisplayMode = .always
    }
    
}
