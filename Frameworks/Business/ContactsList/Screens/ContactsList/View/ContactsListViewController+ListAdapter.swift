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
import Utilities

extension ContactsListViewController {
    
    final class ListAdapter: NSObject {
        
        // MARK: - Observables
        
        let contactSelected: Observable<ContactProjection>
        let listDidScroll: Observable<Void>
        
        // MARK: - Properties
        
        private let _contactSelected = EventEmitter<ContactProjection>()
        private let _listDidScroll = EventEmitter<Void>()
        
        private var isScrolling: Bool = false {
            didSet {
                guard isScrolling != oldValue else { return }
                guard isScrolling == false else { return }
                _listDidScroll.notify(using: ())
            }
        }
        private var items: [ContactProjection]?
        
        // MARK: - Initializers
        
        override init() {
            contactSelected = _contactSelected.asObservable()
            listDidScroll = _listDidScroll.asObservable()
        }
        
        // MARK: - API
        
        func set(items: [ContactProjection]) {
            self.items = items
        }
        
        func prepare(for tableView: UITableView) {
            tableView.register(ContactCell.self)
            tableView.register(LoadingCell.self)
            tableView.register(LackOfContacts.self)
        }
        
        func projections(for paths: [IndexPath]) -> [ContactProjection] {
            guard let items = items, items.isNotEmpty else { return [] }
            
            var results: [ContactProjection] = []
            results.reserveCapacity(paths.count)
            
            for indexPath in paths {
                results.append(items[indexPath.row])
            }
            
            return results
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

extension ContactsListViewController.ListAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (items?[indexPath.row]).flatMap(_contactSelected.notify(using:))
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        isScrolling = true
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        isScrolling = false
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate == false {
            isScrolling = false
        }
    }
    
}
