//
//  ContactsService.swift
//  RestService
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import RestModels

public protocol ContactsService: AnyObject {
    
    // MARK: - API
    
    func getContacts(then completion: @escaping (Result<[ContactDTO], ContactsServiceError>) -> Void)
    
}
