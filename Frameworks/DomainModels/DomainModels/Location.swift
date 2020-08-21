//
//  Location.swift
//  DomainModels
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct Location {
    
    // MARK: - Properties
    
    public let streetName: String
    public let streetNumber: UInt
    public let city: String
    public let state: String
    public let country: String
    public let postCode: String
    
    // MARK: - Initializers
    
    public init(streetName: String, streetNumber: UInt, city: String, state: String, country: String, postCode: String) {
        self.streetName = streetName
        self.streetNumber = streetNumber
        self.city = city
        self.state = state
        self.country = country
        self.postCode = postCode
    }
    
}
