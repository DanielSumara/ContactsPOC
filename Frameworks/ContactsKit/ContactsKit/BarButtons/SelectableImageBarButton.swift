//
//  SelectableImageBarButton.swift
//  ContactsKit
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit
import Utilities

public final class SelectableImageBarButton: UIBarButtonItem {
    
    // MARK: - Events
    
    public var tapped: Action?
    
    // MARK: - Properties
    
    public var isSelected: Bool = false {
        didSet {
            switch isSelected {
            case false: image = defaultImage
            case true: image = selectedImage
            }
        }
    }
    
    private let defaultImage: UIImage
    private let selectedImage: UIImage
    
    // MARK: - Initializers
    
    public init(image: UIImage, selectedImage: UIImage) {
        defaultImage = image
        self.selectedImage = selectedImage
        
        super.init()
        
        self.image = image
        
        target = self
        action = #selector(tapped(_:))
    }
    
    public required init?(coder: NSCoder) { nil }
    
    // MARK: - Actions
    
    @objc
    private func tapped(_ sender: SelectableImageBarButton) {
        tapped?()
    }
    
}
