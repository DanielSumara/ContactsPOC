//
//  ContactsListViewController+ContentView.swift
//  ContactsList
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

extension ContactsListViewController {
    
    final class ContentView: UITableView {
        
        // MARK: - Initializers
        
        init() {
            super.init(frame: .zero, style: .plain)
            
            setupComponents()
        }
        
        required init?(coder: NSCoder) { nil }
        
        // MARK: - API
        
        func reload() {
            switch window {
            case .some: reloadSections(IndexSet(integer: .zero), with: .automatic)
            case .none: reloadData()
            }
        }
        
        // MARK: - Methods
        
        private func setupComponents() {
            backgroundColor = .white
            separatorStyle = .none
            tableFooterView = UIView()
            
            contentInset.bottom = 16
        }
        
    }
    
}
