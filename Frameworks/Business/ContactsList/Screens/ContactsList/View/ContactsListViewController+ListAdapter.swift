//
//  ContactsListViewController+ListAdapter.swift
//  ContactsList
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import ContactsModels
import Extensions
import Foundation
import UIKit

extension ContactsListViewController {
    
    final class ListAdapter: NSObject {
        
        // MARK: - Properties
        
        private var items: [ContactProjection]?
        
        // MARK: - API
        
        func set(items: [ContactProjection]) {
            self.items = items
        }
        
        func prepare(for tableView: UITableView) {
            tableView.register(ContactCell.self)
            tableView.register(LoadingCell.self)
        }
        
    }
    
}

extension ContactsListViewController.ListAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { (items?.count).value(or: 1) }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch items {
        case .none: return tableView.dequeue(LoadingCell.self, at: indexPath, with: true)
        case let .some(contacts): return tableView.dequeue(ContactCell.self, at: indexPath, with: contacts[indexPath.row])
        }
    }
    
}
