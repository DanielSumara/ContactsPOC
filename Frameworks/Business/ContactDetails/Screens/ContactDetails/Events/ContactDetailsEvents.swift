//
//  ContactDetailsEvents.swift
//  ContactDetails
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import Foundation
import Utilities

protocol ContactDetailsEvents: AnyObject {
    
    func edit(_ contact: Contact) 
    
}
