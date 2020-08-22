//
//  TransportToDomainMapper.swift
//  DataRepository
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import Foundation
import RestModels

protocol TransportToDomainMapper: AnyObject {
    
    func contact(from item: ContactDTO) -> Contact
    
}
