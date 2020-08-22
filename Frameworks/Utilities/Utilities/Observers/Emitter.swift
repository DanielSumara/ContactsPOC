//
//  Emitter.swift
//  Utilities
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public final class Emitter<DataType> {
    
    // MARK: - Properties
    
    private let lock = NSLock()
    
    private var observationClosures = [ObjectIdentifier: (DataType) -> Void]()
    
    // MARK: - Initializers
    
    public init() {}
    
    // MARK: - API
    
    public func notify(using subject: DataType) {
        lock.lock()
        defer { lock.unlock() }
        for (_, closure) in observationClosures {
            closure(subject)
        }
    }
    
    public func asObservable() -> Observable<DataType> {
        Observable(emitter: self)
    }
    
    public func observe<ObserverType: AnyObject>(on observer: ObserverType, closure: @escaping (ObserverType, DataType) -> Void) {
        lock.lock()
        defer { lock.unlock() }
        
        let identifier = ObjectIdentifier(observer)
        
        observationClosures[identifier] = { [weak self, weak observer] subject in
            guard let observer = observer else {
                self?.observationClosures[identifier] = nil
                return
            }
            
            closure(observer, subject)
        }
    }
    
    public func remove<ObserverType: AnyObject>(_ observer: ObserverType) {
        lock.lock()
        defer { lock.unlock() }
        
        let identifier = ObjectIdentifier(observer)
        observationClosures[identifier] = nil
    }
    
}
