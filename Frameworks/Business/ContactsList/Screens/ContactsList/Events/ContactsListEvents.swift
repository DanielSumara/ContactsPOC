//
//  ContactsListEvents.swift
//  ContactsList
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import Foundation

protocol ContactsListEvents: AnyObject {
    
    func report(_ error: Error)
    func presentDetails(of contact: Contact)
    
}
