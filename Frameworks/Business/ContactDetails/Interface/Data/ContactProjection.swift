//
//  ContactProjection.swift
//  ContactDetails
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import ContactsModels
import DomainModels
import Foundation

struct ContactProjection {
    
    // MARK: - Properties
    
    let id: Contact
    
    let avatar: AvatarProjection
    let name: String
    let nationality: String
    
    let phoneNumber: String
    let cellNumber: String
    
    let emailAddress: String
    
    let street: String
    let city: String
    let country: String
    
}
