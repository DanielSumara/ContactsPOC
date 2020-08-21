//
//  AvatarProjection.swift
//  ContactsModels
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

public enum AvatarProjection: Hashable {
    
    case initials(String)
    case loading
    case loaded(UIImage)
    
}

