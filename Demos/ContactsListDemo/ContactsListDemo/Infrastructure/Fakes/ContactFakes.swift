//
//  ContactFakes.swift
//  ContactsListDemo
//
//  Created by Daniel Sumara on 24/08/2020.
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
    
    static let marcielePereira = Contact(
        name: PersonName(title: "Mr", first: "Marciele", last: "Pereira"),
        gender: .male,
        location: Location(
            streetName: "Rua Treze",
            streetNumber: 5680,
            city: "Petrolina",
            state: "Santa Catarina",
            country: "Brazil",
            postCode: "13484"
        ),
        email: "marciele.pereira@example.com",
        birthDate: Date(timeIntervalSince1970: 490989773),
        phone: "(31) 7657-6691",
        cell: "(84) 0956-1598",
        picture: Picture(
            large: URL(string: "https://randomuser.me/api/portraits/men/41.jpg")!,
            medium: URL(string: "https://randomuser.me/api/portraits/med/men/41.jpg")!,
            thumbnail: URL(string: "https://randomuser.me/api/portraits/thumb/men/41.jpg")!
        ),
        nationality: .brazil
    )
    
    static let miraPabst = Contact(
        name: PersonName(title: "Mrs", first: "Mira", last: "Pabst"),
        gender: .female,
        location: Location(
            streetName: "Schlossstraße",
            streetNumber: 6177,
            city: "Melle",
            state: "Thüringen",
            country: "Germany",
            postCode: "76440"
        ),
        email: "mira.pabst@example.com",
        birthDate: Date(timeIntervalSince1970: 490989773),
        phone: "0204-0645042",
        cell: "0171-0010351",
        picture: Picture(
            large: URL(string: "https://randomuser.me/api/portraits/women/39.jpg")!,
            medium: URL(string: "https://randomuser.me/api/portraits/med/women/39.jpg")!,
            thumbnail: URL(string: "https://randomuser.me/api/portraits/thumb/women/39.jpg")!
        ),
        nationality: .germany
    )

}

