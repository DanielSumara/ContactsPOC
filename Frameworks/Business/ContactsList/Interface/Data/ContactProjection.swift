//
//  ContactProjection.swift
//  ContactsList
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import ContactsModels
import DomainModels
import Foundation

struct ContactProjection: Hashable {
    
    // MARK: - Properties
    
    let id: Contact
    
    let avatar: AvatarProjection
    let name: String
    let nationality: String
    let isFavorite: Bool
    
}
