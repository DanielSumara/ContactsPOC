//
//  DefaultNetworkSession.swift
//  RestService
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

final class DefaultNetworkSession: NetworkSession {
    
    // MARK: - Properties
    
    private let session: URLSession
    
    // MARK: - Initializers
    
    init(using session: URLSession) {
        self.session = session
    }
    
    // MARK: - API
    
    func invoke(request: URLRequest, then: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkSessionTask {
        let task = session.dataTask(with: request, completionHandler: then)
        task.resume()
        return DefaultNetworkSessionTask(wrapping: task)
    }
    
}
