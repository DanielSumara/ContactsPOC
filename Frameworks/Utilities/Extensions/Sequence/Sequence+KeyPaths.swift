//
//  Sequence+KeyPaths.swift
//  Extensions
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

extension Sequence {
    
    public func map<ValueType>(_ keyPath: KeyPath<Element, ValueType>) -> [ValueType] { map { $0[keyPath: keyPath] } }
    
}
