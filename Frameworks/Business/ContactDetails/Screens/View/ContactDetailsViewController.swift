//
//  ContactDetailsViewController.swift
//  ContactDetails
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

final class ContactDetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    private let contentView = ContentView()
    private let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped(_:)))
    
    // MARK: - Initializers
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = editButton
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - Actions
    
    @objc
    private func editTapped(_ sender: UIBarButtonItem) {
        debugPrint(#function)
    }
    
}
