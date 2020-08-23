//
//  ContactEditFormViewController.swift
//  ContactDetails
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

final class ContactEditFormViewController: UIViewController {
    
    // MARK: - Properties
    
    private let contentView = ContentView()
    
    private lazy var done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(closeTapped(_:)))
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = done
    }
    
    // MARK: - Actions
    
    @objc
    private func closeTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}
