//
//  ImagesRepository.swift
//  Business
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

public protocol ImagesRepository: AnyObject {
    
    func status(for url: URL) -> ImageStatus
    func fetchImage(from url: URL, updates: @escaping (ImageStatus) -> Void)
    
}
