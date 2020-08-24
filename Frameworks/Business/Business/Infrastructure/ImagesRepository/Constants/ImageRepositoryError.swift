//
//  ImageRepositoryError.swift
//  Business
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public enum ImageRepositoryError: LocalizedError {
    
    // MARK: - Cases
    
    case service(Error)
    case noDataInResponse
    case dataIsNotConvertibleToImage
    
    // MARK: - Getters
    
    public var errorDescription: String? {
        switch self {
        case let .service(error): return error.localizedDescription
        case .noDataInResponse: return "Lack of data in response"
        case .dataIsNotConvertibleToImage: return "Data in response is not convertible to image"
        }
    }
    
}
