//
//  ContactDetailsViewController.swift
//  ContactDetails
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import ContactsKit
import Foundation
import Resources
import UIKit

final class ContactDetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    private let contentView = ContentView()
    
    private let favoriteButton = SelectableImageBarButton(image: Icons.star, selectedImage: Icons.starFilled)
    // TODO: - Create "more reactive" control with exposed "tapped" event instead of target/action
    private let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: nil, action: nil)
    
    private let viewModel: ContactDetailsViewModel
    
    // MARK: - Initializers
    
    init(viewModel: ContactDetailsViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        editButton.target = self
        editButton.action = #selector(editTapped(_:))
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.getAvatar()
    }
    
    // MARK: - Methods
    
    private func setupComponents() {
        navigationItem.rightBarButtonItems = [editButton, favoriteButton]
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func bindViewWithViewModel() {
        favoriteButton.tapped = { [viewModel] in viewModel.toggleFavoriteStatus() }
    }
    
    private func bindViewModelWithView() {
        viewModel.contact.observe(on: contentView) { view, contact in view.bind(with: contact) }
        viewModel.isFavorite.observe(on: favoriteButton) { button, isFavorite in button.isSelected = isFavorite }
    }
    
    // MARK: - Actions
    
    @objc
    private func editTapped(_ sender: UIBarButtonItem) {
        viewModel.editContact()
    }
    
}
