//
//  DefaultNetworkSessionTask.swift
//  RestService
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

final class DefaultNetworkSessionTask: NetworkSessionTask {
    
    // MARK: - Properties
    
    private let urlSessionTask: URLSessionTask
    
    // MARK: - Initializers
    
    init(wrapping task: URLSessionTask) {
        urlSessionTask = task
    }
    
    // MARK: - API
    
    func cancel() {
        urlSessionTask.cancel()
    }
    
}
