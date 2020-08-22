//
//  DefaultContactsListViewModel.swift
//  ContactsList
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DataRepository
import DomainModels
import Foundation
import Utilities

final class DefaultContactsListViewModel: ContactsListViewModel {
    
    // MARK: - Observables
    
    let narrowedToFavorites: Observable<Bool>
    let content: Observable<ListContent>
    
    // MARK: - Properties
    
    private let _narrowedToFavorites = ValueEmitter(value: false)
    private let _content = ValueEmitter(value: ListContent.loading)
    
    private let model: ContactsListModel
    
    private var contacts: [Contact] = []
    private var presentedContacts: [Contact] = [] {
        didSet {
            _content.notify(using: .contacts(presentedContacts.map(contactProjection(from:))))
        }
    }
    
    // MARK: - Initializers
    
    init(model: ContactsListModel) {
        self.model = model
        
        narrowedToFavorites = _narrowedToFavorites.asObservable()
        content = _content.asObservable()
    }
    
    // MARK: - API
    
    func getContacts() {
        // Info: - Delay to present loading state of list
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [model] in
            model.observeContacts(on: self) { viewModel, result in
                switch result {
                case let .failure(error): break; #warning("Handle error")
                case let .success(contacts):
                    viewModel.contacts = contacts
                    viewModel.presentedContacts = contacts
                }
            }
        }
    }
    
    func toggleFavorites() {
        _narrowedToFavorites.notify(using: _narrowedToFavorites.value ? false : true)
        presentedContacts = contacts.filter { contact in contact.isFavorite == _narrowedToFavorites.value }
    }
    
    func select(_ contact: ContactProjection) {}
    
    // MARK: - Methods
    
    private func contactProjection(from contact: Contact) -> ContactProjection {
        ContactProjection(
            id: contact,
            avatar: .initials(contact.name.first.first.flatMap(String.init).value(or: "") + contact.name.last.first.flatMap(String.init).value(or: "")),
            name: contact.name.first + " " + contact.name.last,
            nationality: flag(from: contact.nationality.rawValue) + " " + name(from: contact.nationality.rawValue),
            isFavorite: contact.isFavorite
        )
    }
    
    private func flag(from nationalityCode: String) -> String {
        let base = 127397
        var usv = String.UnicodeScalarView()
        for i in nationalityCode.utf16 {
            if let scalar = UnicodeScalar(base + Int(i)) {
                usv.append(scalar)
            }
        }
        return String(usv)
    }
    
    private func name(from nationalityCode: String) -> String {
        Locale.current.localizedString(forRegionCode: nationalityCode).value(or: "")
    }
    
}
