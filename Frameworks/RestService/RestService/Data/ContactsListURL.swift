//
//  ContactsListURL.swift
//  RestService
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

struct ContactsListURL {
    
    // MARK: - Properties
    
    let url: URL
    
    // MARK: - Initializers
    
    init?() {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "randomuser.me"
        components.path = "/api/"
        components.queryItems = [
            URLQueryItem(name: "seed", value: "danielsumara"),
            URLQueryItem(name: "results", value: "100"),
            URLQueryItem(name: "exc", value: "id,login,registered"),
            URLQueryItem(name: "noinfo", value: nil),
        ]
        
        guard let url = components.url else { return nil }
        
        self.url = url
    }
    
}
