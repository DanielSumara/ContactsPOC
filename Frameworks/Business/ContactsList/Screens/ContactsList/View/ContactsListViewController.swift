//
//  ContactsListViewController.swift
//  ContactsList
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import ContactsKit
import Extensions
import Foundation
import Resources
import UIKit

final class ContactsListViewController: UIViewController {
    
    // MARK: - Properties
    
    private let contentView = ContentView()
    private let listAdapter = ListAdapter()
    
    private let favoritesButton = SelectableImageBarButton(image: Icons.star, selectedImage: Icons.starFilled)
    
    private let viewModel: ContactsListViewModel
    
    // MARK: - Initializers
    
    init(viewModel: ContactsListViewModel) {
        self.viewModel = viewModel        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
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
        
        listAdapter.prepare(for: contentView)
        
        contentView.dataSource = listAdapter
        contentView.delegate = listAdapter
    }
    
    private func bindViewModelWithView() {
        viewModel.content.observe(on: self) { view, content in view.setupView(using: content) }
        viewModel.narrowedToFavorites.observe(on: favoritesButton) { button, isSelected in button.isSelected = isSelected }
    }
    
    private func bindViewWithViewModel() {
        favoritesButton.tapped = { [viewModel] in viewModel.toggleFavorites() }
        
        listAdapter.contactSelected.observe(on: self) { (view, selectedContact) in view.viewModel.select(selectedContact) }
        listAdapter.listDidScroll.observe(on: self) { view, _ in view.updateVisibleContacts() }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.getContacts()
    }
    
    // MARK: - Actions
    
    private func setupView(using content: ListContent) {
        switch content {
        case .loading: break
        case let .contacts(contacts):
            navigationItem.rightBarButtonItem = favoritesButton
            listAdapter.set(items: contacts)
            contentView.reload()
            updateVisibleContacts()
        }
    }
    
    private func updateVisibleContacts() {
        guard let indexes = contentView.indexPathsForVisibleRows else { return }
        viewModel.fetchAvatarsFor(contacts: listAdapter.projections(for: indexes))
    }
    
}
