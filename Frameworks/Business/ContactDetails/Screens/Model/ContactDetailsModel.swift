//
//  ContactDetailsModel.swift
//  ContactDetails
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import Foundation

protocol ContactDetailsModel: AnyObject {
    
    // MARK: - Getters
    
    var contact: Contact { get }
    
    // MARK: - API
    
    func favoriteContact()
    func unfavoriteContact() 
    
}
