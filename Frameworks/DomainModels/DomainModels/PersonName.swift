//
//  PersonName.swift
//  DomainModels
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct PersonName: Hashable {
    
    // MARK: - Properties
    
    public let title: String
    public let first: String
    public let last: String
    
    // MARK: - Initializers
    
    public init(title: String, first: String, last: String) {
        self.title = title
        self.first = first
        self.last = last
    }
    
}
