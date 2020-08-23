//
//  Contact+Mocks.swift
//  ContactDetailsTests
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import Foundation

extension Contact {

    static let laurMantyla = Contact(
        name: PersonName(title: "Mr", first: "Lauri", last: "Mantyla"),
        gender: .male,
        location: Location(
            streetName: "Hatanpään Valtatie",
            streetNumber: 5285,
            city: "Pyhäjärvi",
            state: "Southern Ostrobothnia",
            country: "Finland",
            postCode: "35707"
        ),
        email: "lauri.mantyla@example.com",
        birthDate: Date(timeIntervalSince1970: 490989773),
        phone: "06-637-172",
        cell: "040-828-78-68",
        picture: Picture(
            large: URL(string: "https://randomuser.me/api/portraits/men/76.jpg")!,
            medium: URL(string: "https://randomuser.me/api/portraits/med/men/76.jpg")!,
            thumbnail: URL(string: "https://randomuser.me/api/portraits/thumb/men/76.jpg")!
        ),
        nationality: .finland
    )

}
