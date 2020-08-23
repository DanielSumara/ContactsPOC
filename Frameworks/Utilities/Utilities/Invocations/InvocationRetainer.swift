//
//  InvocationRetainer.swift
//  Utilities
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

final class InvocationRetainer {
    
    // MARK: - Static properties
    
    static let instance = InvocationRetainer()
    
    // MARK: - Properties
    
    private var items: [UUID: AnyObject] = [:]
    
    // MARK: - API
    
    func retain(_ object: AnyObject, for uuid: UUID) {
        items[uuid] = object
    }
    
    func releaseObject(with uuid: UUID) {
        items[uuid] = nil
    }
    
}
