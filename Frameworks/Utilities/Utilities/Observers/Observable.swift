//
//  Observable.swift
//  Utilities
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public final class Observable<DataType> {
    
    // MARK: - Properties
    
    private let emitter: Emitter<DataType>
    
    // MARK: - Initializers
    
    init(emitter: Emitter<DataType>) {
        self.emitter = emitter
    }
    
    // MARK: - API
    
    public func observe<ObserverType: AnyObject>(on observer: ObserverType, closure: @escaping (ObserverType, DataType) -> Void) {
        emitter.observe(on: observer, closure: closure)
    }
    
    public func remove<ObserverType: AnyObject>(_ observer: ObserverType) {
        emitter.remove(observer)
    }
    
}
