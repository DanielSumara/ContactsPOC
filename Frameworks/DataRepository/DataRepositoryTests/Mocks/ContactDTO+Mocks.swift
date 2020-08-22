//
//  ContactDTO+Mocks.swift
//  DataRepositoryTests
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
@testable import RestModels

extension ContactDTO {
    
    static let laurMantyla = ContactDTO(
        gender: .male,
        name: .laurMantyla,
        location: LocationDTO(
            street: StreetDTO(number: 5285, name: "Hatanpään Valtatie"),
            city: "Pyhäjärvi",
            state: "Southern Ostrobothnia",
            country: "Finland",
            postCode: "35707"
        ),
        email: "lauri.mantyla@example.com",
        dateOfBirth: DateOfBirthDTO(date: Date(timeIntervalSince1970: 490989773), age: 35),
        phone: "06-637-172",
        cell: "040-828-78-68",
        picture: PictureDTO(
            large: URL(string: "https://randomuser.me/api/portraits/men/76.jpg")!,
            medium: URL(string: "https://randomuser.me/api/portraits/med/men/76.jpg")!,
            thumbnail: URL(string: "https://randomuser.me/api/portraits/thumb/men/76.jpg")!
        ),
        nationality: .finland
    )
    
}
