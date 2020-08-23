//
//  StubbedImagesRepository.swift
//  ContactDetailsTests
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import Foundation

final class StubbedImageRepository: ImagesRepository, Stubbable {
    
    // MARK: - Stubs
    
    lazy var statusStub = stub(of: status)
    lazy var fetchImagesStub = stub(of: fetchImages)
    
    // MARK: - API
    
    func status(for url: URL) -> ImageStatus {
        statusStub(url)
    }
    
    func fetchImages(for urls: [URL], batchUpdates: @escaping () -> Void) {
        fetchImagesStub(urls, batchUpdates)
    }
    
}
