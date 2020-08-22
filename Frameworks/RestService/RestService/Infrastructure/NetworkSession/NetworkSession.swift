//
//  NetworkSession.swift
//  RestService
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

protocol NetworkSession: AnyObject {
    
    func invoke(request: URLRequest, then: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkSessionTask 
    
}
