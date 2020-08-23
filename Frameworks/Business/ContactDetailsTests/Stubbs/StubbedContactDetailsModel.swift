//
//  StubbedContactDetailsModel.swift
//  ContactDetailsTests
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
@testable import ContactDetails
import Foundation

final class StubbedContactDetailsModel: ContactDetailsModel, Stubbable {
    
    // MARK: - Stubs
    
    lazy var favoriteContactStub = stub(of: favoriteContact)
    lazy var unfavoriteContactStub = stub(of: unfavoriteContact)
    
    // MARK: - Properties
    
    var contact: Contact = .laurMantyla
    
    // MARK: - API
    
    func favoriteContact() {
        favoriteContactStub()
    }
    
    func unfavoriteContact() {
        unfavoriteContactStub()
    }
    
}
