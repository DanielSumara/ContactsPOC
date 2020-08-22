//
//  PersonNameDTO.swift
//  RestModels
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct PersonNameDTO: Decodable {
    
    // MARK: - Properties
    
    public let title: String
    public let first: String
    public let last: String
    
}
