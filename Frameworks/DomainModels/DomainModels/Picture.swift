//
//  Picture.swift
//  DomainModels
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public struct Picture: Hashable {
    
    // MARK: - Properties
    
    public let large: URL
    public let medium: URL
    public let thumbnail: URL
    
    // MARK: - Initializers
    
    public init(large: URL, medium: URL, thumbnail: URL) {
        self.large = large
        self.medium = medium
        self.thumbnail = thumbnail
    }
    
}
