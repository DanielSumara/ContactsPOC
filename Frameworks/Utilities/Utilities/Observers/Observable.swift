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
    
    private let parent: ParentBox
    
    // MARK: - Initializers
    
    init(emitter: EventEmitter<DataType>) {
        parent = .event(emitter)
    }
    
    init(emitter: ValueEmitter<DataType>) {
        parent = .value(emitter)
    }
    
    // MARK: - API
    
    public func observe<ObserverType: AnyObject>(on observer: ObserverType, closure: @escaping (ObserverType, DataType) -> Void) {
        parent.observe(on: observer, closure: closure)
    }
    
    public func remove<ObserverType: AnyObject>(_ observer: ObserverType) {
        parent.remove(observer)
    }
    
}

extension Observable {
    
    private enum ParentBox {
        
        // MARK: - Cases
        
        case event(EventEmitter<DataType>)
        case value(ValueEmitter<DataType>)
        
        // MARK: - API
        
        public func observe<ObserverType: AnyObject>(on observer: ObserverType, closure: @escaping (ObserverType, DataType) -> Void) {
            switch self {
            case let .event(emitter): emitter.observe(on: observer, closure: closure)
            case let .value(emitter): emitter.observe(on: observer, closure: closure)
            }
        }
        
        public func remove<ObserverType: AnyObject>(_ observer: ObserverType) {
            switch self {
            case let .event(emitter): emitter.remove(observer)
            case let .value(emitter): emitter.remove(observer)
            }
        }
        
    }
    
}
