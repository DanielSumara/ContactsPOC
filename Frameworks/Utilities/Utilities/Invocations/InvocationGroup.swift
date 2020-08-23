//
//  InvocationGroup.swift
//  Utilities
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public final class InvocationGroup<ResultType> {
    
    // MARK: - Properties
    
    private let retainer: InvocationRetainer
    
    private let uuid = UUID()
    private let dispatchGroup = DispatchGroup()
    
    private var results: [ResultType] = []
    
    // MARK: - Initializers
    
    public convenience init() {
        self.init(retainer: .instance)
    }
    
    init(retainer: InvocationRetainer) {
        self.retainer = retainer
    }
    
    // MARK: - API
    
    @discardableResult
    public func append(_ method: @escaping (@escaping (ResultType) -> Void) -> Void) -> Self {
        dispatchGroup.enter()
        method { [weak self] result in
            self?.results.append(result)
            self?.dispatchGroup.leave()
        }
        return self
    }
    
    @discardableResult
    public func append<ArgumentType>(_ method: @escaping (ArgumentType, @escaping (ResultType) -> Void) -> Void, with argument: ArgumentType) -> Self {
        dispatchGroup.enter()
        method(argument) { [weak self] result in
            self?.results.append(result)
            self?.dispatchGroup.leave()
        }
        return self
    }
    
    public func invoke(completion: @escaping ([ResultType]) -> Void) {
        retainer.retain(self, for: uuid)
        
        dispatchGroup.notify(queue: .main) { [weak self, retainer, uuid] in
            defer { retainer.releaseObject(with: uuid) }
            
            if let results = self?.results {
                completion(results)
            } else {
                completion([])
            }
        }
    }
    
}
