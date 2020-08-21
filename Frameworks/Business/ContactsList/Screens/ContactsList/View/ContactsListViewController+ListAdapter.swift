//
//  ContactsListViewController+ListAdapter.swift
//  ContactsList
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import ContactsModels
import Foundation
import UIKit

extension ContactsListViewController {
    
    final class ListAdapter: NSObject {
        
        // MARK: - Properties
        
        private var items: [Int] = []
        
        // MARK: - API
        
        func set(items: [Int]) {
            self.items = items
        }
        
        func prepare(for tableView: UITableView) {
            tableView.register(ContactCell.self)
        }
        
    }
    
}

extension ContactsListViewController.ListAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { items.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeue(ContactCell.self, at: indexPath, with: items[indexPath.row])
    }
    
}
