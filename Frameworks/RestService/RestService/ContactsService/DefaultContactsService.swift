//
//  DefaultContactsService.swift
//  RestService
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import RestModels
import Utilities

public final class DefaultContactsService: ContactsService {
    
    // MARK: - Properties
    
    private let networkSession: NetworkSession
    private let decoder: JSONDecoder
    
    private weak var ongoingRequest: NetworkSessionTask?
    
    // MARK: - Initializers
    
    public convenience init() {
        let decoder = JSONDecoder()
        let dateConverter = ServiceDateDecoder(dateConverter: DefaultStringToDateConverter())
        decoder.dateDecodingStrategy = .custom(dateConverter.date(from:))
        self.init(networkSession: DefaultNetworkSession(using: .shared), decoder: decoder)
    }
    
    init(networkSession: NetworkSession, decoder: JSONDecoder) {
        self.networkSession = networkSession
        self.decoder = decoder
    }
    
    // MARK: - API
    
    public func getContacts(then completion: @escaping (Result<[ContactDTO], ContactsServiceError>) -> Void) {
        guard let url = ContactsListURL()?.url else { return completion(.failure(.invalidUrl)) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        ongoingRequest = networkSession.invoke(request: request) { [decoder] data, response, error in
            if let error = error { return completion(.failure(.service(error))) }
            
            guard let data = data else { return completion(.failure(.invalidResponse)) }
            guard let response = response as? HTTPURLResponse else { return completion(.failure(.invalidResponse)) }
            
            guard (200 ... 299).contains(response.statusCode) else {
                do {
                    let serviceError = try decoder.decode(ServiceError.self, from: data)
                    return completion(.failure(.service(serviceError)))
                } catch {
                    return completion(.failure(.decoding(error)))
                }
            }
            
            // TODO: - Encapsulate decoding (Create specialized component for decoding response data)
            
            do {
                let results = try decoder.decode(ContactsResultsDTO.self, from: data)
                completion(.success(results.results))
            } catch {
                return completion(.failure(.decoding(error)))
            }
        }
    }
    
}
