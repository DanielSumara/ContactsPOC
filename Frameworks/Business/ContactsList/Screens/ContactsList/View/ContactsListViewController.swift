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
    private let listAdapter = ListAdapter()
    
    // MARK: - Initializers
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contacts"
        navigationItem.largeTitleDisplayMode = .always
        
        listAdapter.prepare(for: contentView)
        
        contentView.dataSource = listAdapter
        
        listAdapter.set(items: [1, 2, 3, 4, 5])
    }
    
}
