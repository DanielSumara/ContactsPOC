//
//  StubbedNetworkSessionTask.swift
//  RestServiceTests
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
@testable import RestService

final class StubbedNetworkSessionTask: NetworkSessionTask, Stubbable {
    
    // MARK: - Stubs
    
    lazy var cancelStub = stub(of: cancel)
    
    // MARK: - API
    
    func cancel() {
        cancelStub()
    }
    
}
