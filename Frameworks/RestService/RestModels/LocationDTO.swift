//
//  LocationDTO.swift
//  RestModels
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct LocationDTO: Decodable {
    
    // MARK: -  Properties
    
    public let street: StreetDTO
    public let city: String
    public let state: String
    public let country: String
    public let postCode: String
    
    // MARK: - Initializers
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        street = try container.decode(StreetDTO.self, forKey: .street)
        city = try container.decode(String.self, forKey: .city)
        state = try container.decode(String.self, forKey: .state)
        country = try container.decode(String.self, forKey: .country)
        
        if let postCode = try? container.decode(String.self, forKey: .postCode) {
            self.postCode = postCode
        } else {
            postCode = try container.decode(UInt.self, forKey: .postCode).description
        }
    }
    
    init(street: StreetDTO, city: String, state: String, country: String, postCode: String) {
        self.street = street
        self.city = city
        self.state = state
        self.country = country
        self.postCode = postCode
    }
    
}

extension LocationDTO {
    
    private enum CodingKeys: String, CodingKey {
        
        case street
        case city
        case state
        case country
        case postCode = "postcode"
        
    }
    
}
