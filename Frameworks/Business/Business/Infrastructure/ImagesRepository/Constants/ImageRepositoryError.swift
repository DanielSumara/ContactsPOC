//
//  ImageRepositoryError.swift
//  Business
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public enum ImageRepositoryError: Error {
    
    case service(Error)
    case noDataInResponse
    case dataIsNotConvertibleToImage
    
}
