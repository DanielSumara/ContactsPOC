//
//  ContactDetailsScreen.swift
//  ContactDetails
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import DomainModels
import DataRepository
import Foundation
import UIKit

final class ContactDetailsScreen: Screen {
    
    // MARK: - Properties
    
    let events: ContactDetailsScreenEvents
    let viewController: UIViewController
    
    // MARK: - Initializers
    
    init(contact: Contact, repository: ContactsRepository, imagesRepository: ImagesRepository) {
        let events = DefaultContactDetailsEvents()
        
        let model = DefaultContactDetailsModel(contact: contact, repository: repository)
        let viewModel = DefaultContactDetailsViewModel(model: model, mapper: DefaultDomainToInterfaceMapper(), events: events, imageRepository: imagesRepository)
        
        self.events = events
        viewController = ContactDetailsViewController(viewModel: viewModel)
    }
    
}
