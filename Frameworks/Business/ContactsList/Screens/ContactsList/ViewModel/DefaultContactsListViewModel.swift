//
//  DefaultContactsListViewModel.swift
//  ContactsList
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import ContactsModels
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
    
    private let events: ContactsListEvents
    private let imageRepository: ImagesRepository
    private let model: ContactsListModel
    
    private var contacts: [Contact] = []
    private var presentedContacts: [ContactProjection] = [] { didSet { _content.notify(using: .contacts(presentedContacts)) } }
    
    // MARK: - Initializers
    
    init(model: ContactsListModel, imageRepository: ImagesRepository, events: ContactsListEvents) {
        self.events = events
        self.imageRepository = imageRepository
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
                case let .failure(error): viewModel.events.report(error)
                case let .success(contacts):
                    viewModel.contacts = contacts
                    viewModel.presentedContacts = contacts.map(viewModel.contactProjection(from:))
                }
            }
        }
    }
    
    func toggleFavorites() {
        _narrowedToFavorites.notify(using: _narrowedToFavorites.value ? false : true)
        reload()
    }
    
    func select(_ contact: ContactProjection) {
        events.presentDetails(of: contact.id)
    }
    
    func fetchAvatarsFor(contacts: [ContactProjection]) {
        for contact in contacts {
            guard case .uncached = imageRepository.status(for: contact.id.picture.thumbnail) else { continue }
            imageRepository.fetchImage(from: contact.id.picture.thumbnail) { [weak self] status in
                switch status {
                case .loaded: self?.reload()
                case .loading: self?.reload()
                case .invalid: break // INFO: - Handle by showing error indicator on AvatarView
                case .uncached: break
                }
            }
        }
    }
    
    // MARK: - Methods
    
    private func reload() {
        presentedContacts = contacts
            .filter { contact in contact.isFavorite == _narrowedToFavorites.value }
            .map(contactProjection(from:))
    }
    
    private func contactProjection(from contact: Contact) -> ContactProjection {
        ContactProjection(
            id: contact,
            avatar: avatarProjection(for: contact),
            name: contact.name.first + " " + contact.name.last,
            nationality: flag(from: contact.nationality.rawValue) + " " + name(from: contact.nationality.rawValue),
            isFavorite: contact.isFavorite
        )
    }
    
    private func avatarProjection(for contact: Contact) -> AvatarProjection {
        switch imageRepository.status(for: contact.picture.thumbnail) {
        case .uncached: return .initials(contact.name.initials)
        case .invalid: return .initials(contact.name.initials) // TODO: - Handle by showing error indicator on AvatarView
        case .loading: return .loading(contact.name.initials)
        case let .loaded(image): return .loaded(image)
        }
    }
    
    // INFO: - This method should be moved to mapper object or similar utility class
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
    
    // INFO: - This method should be moved to mapper object or similar utility class
    private func name(from nationalityCode: String) -> String {
        Locale.current.localizedString(forRegionCode: nationalityCode).value(or: "")
    }
    
}
