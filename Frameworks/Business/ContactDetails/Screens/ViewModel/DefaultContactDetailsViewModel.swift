//
//  DefaultContactDetailsViewModel.swift
//  ContactDetails
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import ContactsModels
import Foundation
import Utilities

final class DefaultContactDetailsViewModel: ContactDetailsViewModel {
    
    // MARK: - Observables
    
    let contact: Observable<ContactProjection>
    let isFavorite: Observable<Bool>
    
    // MARK: - Properties
    
    private let _contact: ValueEmitter<ContactProjection>
    private let _isFavorite: ValueEmitter<Bool>
    
    private let events: ContactDetailsEvents
    private let imageRepository: ImagesRepository
    private let mapper: DomainToInterfaceMapper
    private let model: ContactDetailsModel
    
    // MARK: - Initializers
    
    init(model: ContactDetailsModel, mapper: DomainToInterfaceMapper, events: ContactDetailsEvents, imageRepository: ImagesRepository) {
        self.events = events
        self.imageRepository = imageRepository
        self.mapper = mapper
        self.model = model
        
        _contact = ValueEmitter(value: mapper.contactProjection(from: model.contact, using: .initials(model.contact.name.initials)))
        _isFavorite = ValueEmitter(value: model.contact.isFavorite)
        
        contact = _contact.asObservable()
        isFavorite = _isFavorite.asObservable()
    }
    
    // MARK: - API
    
    func getAvatar() {
        imageRepository.fetchImages(for: [model.contact.picture.large]) { [weak self] in self?.reload() }
    }
    
    func editContact() {
        events.edit(model.contact)
    }
    
    func toggleFavoriteStatus() {
        switch _isFavorite.value {
        case true: model.unfavoriteContact()
        case false: model.favoriteContact()
        }
        
        _isFavorite.notify(using: model.contact.isFavorite)
    }
    
    // MARK: - Methods
    
    private func reload() {
        let avatarProjection: AvatarProjection
        switch imageRepository.status(for: model.contact.picture.large) {
        case .invalid: avatarProjection = .initials(model.contact.name.initials) // TODO: - Make error indicator on AvatarView
        case .loading: avatarProjection = .loading(model.contact.name.initials)
        case .uncached: avatarProjection = .initials(model.contact.name.initials)
        case let .loaded(image): avatarProjection = .loaded(image)
        }
        _contact.notify(using: mapper.contactProjection(from: model.contact, using: avatarProjection))
    }
    
}

