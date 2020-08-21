//
//  Contact.swift
//  DomainModels
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct Contact {
    
    // MARK: - Properties
    
    public let name: PersonName
    public let gender: Gender
    public let location: Location
    public let email: String
    public let birthDate: Date
    public let phone: String
    public let cell: String
    public let picture: Picture
    public let nationality: Nationality
    
    // MARK: - Initializers
    
    public init(name: PersonName, gender: Gender, location: Location, email: String, birthDate: Date, phone: String, cell: String, picture: Picture, nationality: Nationality) {
        self.name = name
        self.gender = gender
        self.location = location
        self.email = email
        self.birthDate = birthDate
        self.phone = phone
        self.cell = cell
        self.picture = picture
        self.nationality = nationality
    }
    
}
