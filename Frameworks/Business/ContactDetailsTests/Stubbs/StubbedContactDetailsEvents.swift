//
//  StubbedContactDetailsEvents.swift
//  ContactDetailsTests
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

@testable import ContactDetails
import DomainModels
import Foundation

final class StubbedContactDetailsEvents: ContactDetailsEvents, Stubbable {
    
    // MARK: - Stubbs
    
    lazy var editContactStub = stub(of: edit)
    
    // MARK: - API
    
    func edit(_ contact: Contact) {
        editContactStub(contact)
    }
    
}
