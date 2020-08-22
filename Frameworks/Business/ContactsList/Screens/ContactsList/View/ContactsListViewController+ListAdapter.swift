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
            tableView.register(LackOfContacts.self)
        }
        
    }
    
}

extension ContactsListViewController.ListAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch items {
        case .none: return 1
        case let .some(items):
            switch items.count {
            case 0: return 1
            default: return items.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch items {
        case .none: return tableView.dequeue(LoadingCell.self, at: indexPath, with: true)
        case let .some(contacts):
            switch contacts.count {
            case 0: return tableView.dequeue(LackOfContacts.self, at: indexPath, with: true)
            default: return tableView.dequeue(ContactCell.self, at: indexPath, with: contacts[indexPath.row])
            }
        }
    }
    
}
