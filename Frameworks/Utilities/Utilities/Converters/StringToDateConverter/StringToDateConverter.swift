//
//  StringToDateConverter.swift
//  Utilities
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public protocol StringToDateConverter: AnyObject {
    
    func date(from string: String) -> Date?
    
}
