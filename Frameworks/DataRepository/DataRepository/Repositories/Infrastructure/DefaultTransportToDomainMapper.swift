//
//  DefaultTransportToDomainMapper.swift
//  DataRepository
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import DomainModels
import Foundation
import RestModels

final class DefaultTransportToDomainMapper:  TransportToDomainMapper {
    
    // MARK: - API
    
    func contact(from item: ContactDTO) -> Contact {
        Contact(
            name: personName(from: item.name),
            gender: gender(from: item.gender),
            location: location(from: item.location),
            email: item.email,
            birthDate: item.dateOfBirth.date,
            phone: item.phone,
            cell: item.cell,
            picture: picture(from: item.picture),
            nationality: nationality(from: item.nationality)
        )
    }
    
    // MARK: - Methods
    
    private func personName(from item: PersonNameDTO) -> PersonName {
        PersonName(title: item.title, first: item.first, last: item.last)
    }
    
    private func gender(from item: GenderDTO) -> Gender {
        switch item {
        case .female: return .female
        case .male: return .male
        }
    }
    
    private func location(from item: LocationDTO) -> Location {
        Location(streetName: item.street.name, streetNumber: item.street.number, city: item.city, state: item.state, country: item.country, postCode: item.postCode)
    }
    
    private func picture(from item: PictureDTO) -> Picture {
        Picture(large: item.large, medium: item.medium, thumbnail: item.thumbnail)
    }
    
    private func nationality(from item: NationalityDTO) -> Nationality {
        switch item {
        case .australia: return .australia
        case .brazil: return .brazil
        case .canada: return .canada
        case .switzerland: return .switzerland
        case .germany: return .germany
        case .denmark: return .denmark
        case .spain: return .spain
        case .finland: return .finland
        case .france: return .france
        case .unitedKingdom: return .unitedKingdom
        case .ireland: return .ireland
        case .iran: return .iran
        case .norway: return .norway
        case .netherlands: return .netherlands
        case .newZeland: return .newZeland
        case .turkey: return .turkey
        case .unitedStates: return .unitedStates
        }
    }
    
}

