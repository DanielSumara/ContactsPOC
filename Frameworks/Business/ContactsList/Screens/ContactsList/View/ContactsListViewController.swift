//
//  ContactsListViewController.swift
//  ContactsList
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import ContactsKit
import Foundation
import Resources
import UIKit

final class ContactsListViewController: UIViewController {
    
    // MARK: - Properties
    
    private let contentView = ContentView()
    private let listAdapter = ListAdapter()
    
    private let favoritesButton = SelectableImageBarButton(image: Icons.star, selectedImage: Icons.starFilled)
    
    // MARK: - Initializers
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComponents()
        bindViewModelWithView()
        bindViewWithViewModel()
    }
    
    // MARK: - Methods
    
    private func setupComponents() {
        title = "Contacts"
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.rightBarButtonItem = favoritesButton
        
        listAdapter.prepare(for: contentView)
        
        contentView.dataSource = listAdapter
    }
    
    private func bindViewModelWithView() {
        listAdapter.set(items: [1, 2, 3, 4])
    }
    
    private func bindViewWithViewModel() {
        favoritesButton.tapped = { }
    }
    
}
