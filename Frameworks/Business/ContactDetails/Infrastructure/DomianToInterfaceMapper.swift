//
//  DomianToInterfaceMapper.swift
//  ContactDetails
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import ContactsModels
import DomainModels
import Foundation

protocol DomainToInterfaceMapper: AnyObject {
    
    func contactProjection(from item: Contact, using avatar: AvatarProjection) -> ContactProjection
    
}
