//
//  ContactDTO.swift
//  RestModels
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct ContactDTO: Decodable {
    
    // MARK: - Properties
    
    public let gender: GenderDTO
    public let name: PersonNameDTO
    public let location: LocationDTO
    public let email: String
    public let dateOfBirth: DateOfBirthDTO
    public let phone: String
    public let cell: String
    public let picture: PictureDTO
    public let nationality: NationalityDTO
    
}

extension ContactDTO {
    
    private enum CodingKeys: String, CodingKey {
        
        // MARK: - Cases
        
        case gender
        case name
        case location
        case email
        case dateOfBirth = "dob"
        case phone
        case cell
        case picture
        case nationality = "nat"
        
    }
    
}
