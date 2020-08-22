//
//  StubbedContactsService.swift
//  DataRepositoryTests
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import RestModels
import RestService

final class StubbedContactsService: ContactsService, Stubbable {
    
    // MARK: - Stubbs
    
    lazy var getContactsStub = stub(of: getContacts)
    
    // MARK: - API
    
    func getContacts(then completion: @escaping (Result<[ContactDTO], ContactsServiceError>) -> Void) {
        getContactsStub(completion)
    }
    
}
