//
//  ContactDetailsViewModel.swift
//  ContactDetails
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import Utilities

protocol ContactDetailsViewModel: AnyObject {
    
    // MARK: - Observables
    
    var contact: Observable<ContactProjection> { get }
    var isFavorite: Observable<Bool> { get }
    
    // MARK: - API
    
    func getAvatar()
    
    func editContact()
    func toggleFavoriteStatus()
    
}
