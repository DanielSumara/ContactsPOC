//
//  DefaultContactsService+Tests.swift
//  RestServiceTests
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
@testable import RestService
import XCTest
import Utilities

final class DefaultContactsService_Tests: XCTestCase {
    
    // MARK: - Properties
    
    private let networkSession = StubbedNetworkSession()
    private let dateDecoder = ServiceDateDecoder(dateConverter: DefaultStringToDateConverter())
    private let decoder = JSONDecoder()
    
    private lazy var sut = DefaultContactsService(networkSession: networkSession, decoder: decoder)
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        decoder.dateDecodingStrategy = .custom(dateDecoder.date(from:))
    }
    
    // MARK: - Tests
    
    func test_URLIsValid() {
        var invokedInvoked = false
        
        networkSession.invokeStub = { _, completion in
            invokedInvoked = true
            completion(nil, nil, nil)
            return StubbedNetworkSessionTask()
        }
        
        let completionInvoked = expectation(description: "Completion invoked")
        
        sut.getContacts { result in
            completionInvoked.fulfill()
            
            switch result {
            case .failure: break
            case .success: XCTFail("This invocation should fail.")
            }
        }
        
        XCTAssertTrue(invokedInvoked)
        wait(for: [completionInvoked], timeout: 1)
    }
    
    func test_FinishWithValidItem() throws {
        let data = String.validPayload.data(using: .utf8)
        let validResponse = HTTPURLResponse(url: try XCTUnwrap(ContactsListURL()?.url), statusCode: 200, httpVersion: nil, headerFields: nil)
        
        networkSession.invokeStub = { _, completion in
            completion(data, validResponse, nil)
            return StubbedNetworkSessionTask()
        }
        
        sut.getContacts { result in
            switch result {
            case let .success(items): XCTAssertEqual(items.count, 1)
            case let .failure(error): XCTFail(error.localizedDescription)
            }
        }
    }
    
}

extension String {
    
    fileprivate static let validPayload = """
    {"results":[{"gender":"male","name":{"title":"Mr","first":"Lauri","last":"Mantyla"},"location":{"street":{"number":5285,"name":"Hatanpään Valtatie"},"city":"Pyhäjärvi","state":"Southern Ostrobothnia","country":"Finland","postcode":35707,"coordinates":{"latitude":"-8.0879","longitude":"-138.0819"},"timezone":{"offset":"+8:00","description":"Beijing, Perth, Singapore, Hong Kong"}},"email":"lauri.mantyla@example.com","dob":{"date":"1985-07-23T18:02:53.000Z","age":35},"phone":"06-637-172","cell":"040-828-78-68","picture":{"large":"https://randomuser.me/api/portraits/men/76.jpg","medium":"https://randomuser.me/api/portraits/med/men/76.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/men/76.jpg"},"nat":"FI"}]}
    """
    
}
