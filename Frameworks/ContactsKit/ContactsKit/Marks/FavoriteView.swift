//
//  FavoriteView.swift
//  ContactsKit
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit
import Resources

public final class FavoriteView: UIImageView {
    
    // MARK: - Getters
    
    public override var intrinsicContentSize: CGSize { CGSize(width: 24, height: 24) }
    
    // MARK: - Initializers
    
    public init() {
        super.init(frame: .zero)
        
        setupControls()
    }
    
    public required init?(coder: NSCoder) { nil }
    
    // MARK: - API
    
    public func bind(with isSelected: Bool) {
        switch isSelected {
        case true: image = Icons.starFilled
        case false: image = Icons.star
        }
    }
    
    // MARK: - Methods
    
    private func setupControls() {
        setContentHuggingPriority(.required, for: .horizontal)
        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .horizontal)
        setContentCompressionResistancePriority(.required, for: .vertical)
        
        image = Icons.star
    }
}
