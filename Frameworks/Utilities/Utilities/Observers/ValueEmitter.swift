//
//  ValueEmitter.swift
//  Utilities
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public final class ValueEmitter<DataType> {
    
    // MARK: - Properties
    
    public private(set) var value: DataType
    
    private var observationClosures = [ObjectIdentifier: (DataType) -> Void]()
    
    // MARK: - Initializers
    
    public init(value: DataType) {
        self.value = value
    }
    
    // MARK: - API
    
    public func notify(using subject: DataType) {
        value = subject
        
        for (_, closure) in observationClosures {
            closure(subject)
        }
    }
    
    public func asObservable() -> Observable<DataType> {
        Observable(emitter: self)
    }
    
    public func observe<ObserverType: AnyObject>(on observer: ObserverType, closure: @escaping (ObserverType, DataType) -> Void) {
        let identifier = ObjectIdentifier(observer)
        
        observationClosures[identifier] = { [weak self, weak observer] subject in
            guard let observer = observer else {
                self?.observationClosures[identifier] = nil
                return
            }
            
            closure(observer, subject)
        }
        
        closure(observer, value)
    }
    
    public func remove<ObserverType: AnyObject>(_ observer: ObserverType) {
        let identifier = ObjectIdentifier(observer)
        observationClosures[identifier] = nil
    }
    
}
