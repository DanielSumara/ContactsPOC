//
//  ImageStatus.swift
//  Business
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

public enum ImageStatus {
    
    // MARK: - Cases
    
    case uncached
    case loading
    case loaded(UIImage)
    
    case invalid(ImageRepositoryError)
    
    // MARK: - Getters
    
    var isUncached: Bool {
        switch self {
        case .uncached: return true
        default: return false
        }
    }
    
}
