//
//  DefaultDomainToInterfaceMapper.swift
//  ContactDetails
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import ContactsModels
import DomainModels
import Foundation

final class DefaultDomainToInterfaceMapper: DomainToInterfaceMapper {
    
    // MARK: - Properties
    
    private let locale: Locale = .current
    
    // MARK: - API
    
    func contactProjection(from item: Contact, using avatar: AvatarProjection) -> ContactProjection {
        ContactProjection(
            id: item,
            avatar: avatar,
            name: "\(item.name.title) \(item.name.first) \(item.name.last)",
            nationality: "\(flag(from: item.nationality.rawValue)) \(name(from: item.nationality.rawValue))",
            phoneNumber: item.phone,
            cellNumber: item.cell,
            emailAddress: item.email,
            street: "\(item.location.streetName) \(item.location.streetNumber.description)",
            city: "\(item.location.postCode) \(item.location.city)",
            country: "\(item.location.state) (\(item.location.country))"
        )
    }
    
    // MARK: - Methods
    
    private func flag(from nationalityCode: String) -> String {
        let base = 127397
        var usv = String.UnicodeScalarView()
        for i in nationalityCode.utf16 {
            if let scalar = UnicodeScalar(base + Int(i)) {
                usv.append(scalar)
            }
        }
        return String(usv)
    }
    
    
    private func name(from nationalityCode: String) -> String {
        locale.localizedString(forRegionCode: nationalityCode).value(or: "")
    }
    
}
