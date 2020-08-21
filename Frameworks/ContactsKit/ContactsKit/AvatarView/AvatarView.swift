//
//  AvatarView.swift
//  ContactsKit
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import ContactsModels
import Foundation
import Resources
import UIKit
import ViewLayout

public final class AvatarView: UIView, Bindable {
    
    // MARK: - Getters
    
    override public var intrinsicContentSize: CGSize { kind.intrinsicContentSize }
    
    // MARK: - Properties
    
    private let initialsLabel = InitialLabel()
    private let loadingIndicator = UIActivityIndicatorView(style: .whiteLarge)
    private let imageView = UIImageView()
    
    private let kind: Kind
    
    // MARK: - Initializers
    
    public init(kind: Kind) {
        self.kind = kind
        
        super.init(frame: .zero)
        
        setupControls()
        setupLayout()
    }
    
    public required init?(coder: NSCoder) { nil }
    
    // MARK: - API
    
    public func bind(with data: AvatarProjection) {
        setupAppearance(for: data)
        setupControls(for: data)
    }
    
    // MARK: - Methods
    
    private func setupControls() {
        setContentHuggingPriority(.required, for: .horizontal)
        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .horizontal)
        setContentCompressionResistancePriority(.required, for: .vertical)
        
        layer.cornerRadius = intrinsicContentSize.height / 2
        
        backgroundColor = Colors.midGray
        initialsLabel.textAlignment = .center
    }
    
    private func setupLayout() {
        layout.add(subviews: initialsLabel, loadingIndicator, imageView)
        initialsLabel.layout.embed(in: self)
        loadingIndicator.layout.embed(in: self)
        imageView.layout.embed(in: self)
    }
    
    private func setupAppearance(for data: AvatarProjection) {
        switch data {
        case .initials:
            initialsLabel.isHidden = false
            loadingIndicator.isHidden = true
            imageView.isHidden = true
        case .loading:
            initialsLabel.isHidden = true
            loadingIndicator.isHidden = false
            imageView.isHidden = true
        case .loaded:
            initialsLabel.isHidden = true
            loadingIndicator.isHidden = true
            imageView.isHidden = false
        }
    }
    
    private func setupControls(for data: AvatarProjection) {
        switch data {
        case let .initials(initials): initialsLabel.text = initials
        case .loading: loadingIndicator.startAnimating()
        case let .loaded(image): imageView.image = image
        }
    }
    
}
