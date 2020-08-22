//
//  DefaultImagesRepository.swift
//  Business
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Extensions
import Foundation
import UIKit

public final class DefaultImagesRepository: ImagesRepository {
    
    // MARK: - Properties
    
    private let lock = NSLock()
    private let session: URLSession = .shared
    
    private var cache: [URL: ImageStatus] = [:]
    
    // MARK: - Initializers
    
    public init() {}
    
    // MARK: - API
    
    public func status(for url: URL) -> ImageStatus {
        lock.lock()
        defer { lock.unlock() }
        
        return cache[url].value(or: ImageStatus.uncached)
    }
    
    public func fetchImage(from url: URL, updates: @escaping (ImageStatus) -> Void) {
        cache[url] = .loading
        updates(.loading)
        
        let task = session.dataTask(with: url) { [weak self] data, _, error in
            let updatesWrapper: (ImageStatus) -> Void = { status in DispatchQueue.main.async { updates(status) } }
            
            if let error = error {
                self?.set(.invalid(.service(error)), for: url)
                return updatesWrapper(.invalid(.service(error)))
            }
            
            // TODO: - Make some components to handle validation and converting data into image
            
            guard let data = data else {
                self?.set(.invalid(.noDataInResponse), for: url)
                return updatesWrapper(.invalid(.noDataInResponse))
            }
            
            guard let image = UIImage(data: data) else {
                self?.set(.invalid(.dataIsNotConvertibleToImage), for: url)
                return updatesWrapper(.invalid(.dataIsNotConvertibleToImage))
            }
            
            self?.set(.loaded(image), for: url)
            updatesWrapper(.loaded(image))
        }
        task.resume()
    }
    
    // MARK: - Methods
    
    private func set(_ state: ImageStatus, for url: URL) {
        lock.lock()
        defer { lock.unlock() }
        
        cache[url] = state
    }
    
}
