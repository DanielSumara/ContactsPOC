//
//  ContactsRepositoryError.swift
//  DataRepository
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public enum ContactsRepositoryError: LocalizedError {

    // MARK: - Cases
    
    case service(Error)
    
    // MARK: - Getters
    
    public var errorDescription: String? {
        switch self {
        case let .service(error): return error.localizedDescription
        }
    }

}
