//
//  ContactsRepositoryError.swift
//  DataRepository
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public enum ContactsRepositoryError: Error {
    
    case service(Error)
    
}
