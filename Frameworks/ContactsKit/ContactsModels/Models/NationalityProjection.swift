//
//  NationalityProjection.swift
//  ContactsModels
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct NationalityProjection: Hashable {
    
    // MARK: - Properties
    
    public let countryName: String
    public let flagIcon: String
    
    // MARK: - Initializers
    
    public init(countryName: String, flagIcon: String) {
        self.countryName = countryName
        self.flagIcon = flagIcon
    }
    
}

