//
//  StubbedNetworkSession.swift
//  RestServiceTests
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
@testable import RestService

final class StubbedNetworkSession: NetworkSession, Stubbable {
    
    // MARK: - Stubs
    
    lazy var invokeStub = stub(of: invoke)
    
    // MARK: - API
    
    func invoke(request: URLRequest, then: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkSessionTask {
        invokeStub(request, then)
    }
    
}
