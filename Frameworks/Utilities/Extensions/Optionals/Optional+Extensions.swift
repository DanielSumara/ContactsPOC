//
//  Optional+Extensions.swift
//  Extensions
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

extension Optional {
    
    public func value(or value: @autoclosure () -> Wrapped) -> Wrapped {
        switch self {
        case .none: return value()
        case let .some(value): return value
        }
    }

}
