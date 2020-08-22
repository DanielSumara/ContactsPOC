//
//  ListContent.swift
//  ContactsList
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

enum ListContent {
    
    case loading
    case lackOfContacts
    case contacts([ContactProjection])
    
}
