//
//  AvatarView+Kind.swift
//  ContactsKit
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

extension AvatarView {
    
    public enum Kind {
        
        // MARK: - Cases
        
        case thumbnail
        case large
        
        // MARK: - Getters
        
        var intrinsicContentSize: CGSize {
            switch self {
            case .thumbnail: return CGSize(width: 48, height: 48)
            case .large: return CGSize(width: 128, height: 128)
            }
        }
        
    }
    
}
