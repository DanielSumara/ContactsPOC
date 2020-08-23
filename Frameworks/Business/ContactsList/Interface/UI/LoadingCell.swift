//
//  LoadingCell.swift
//  ContactsList
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import ContactsKit
import ContactsModels
import Foundation
import Resources
import UIKit

final class LoadingCell: UITableViewCell, Bindable {
    
    // MARK: - Properties
    
    private let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    private let descriptionLabel = FootnoteLabel()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupComponents()
        setupLayout()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - API
    
    func bind(with data: Bool) {
        activityIndicator.startAnimating()
    }
    
    // MARK: - Methods
    
    private func setupComponents() {
        selectionStyle = .none
        activityIndicator.color = .gray
        descriptionLabel.textAlignment = .center
        descriptionLabel.text = "Loading contacts..."
    }
    
    private func setupLayout() {
        contentView.layout.add(subviews: activityIndicator, descriptionLabel)
        
        activityIndicator.layout
            .make(.top, equalTo: contentView, .top, constant: 150)
            .make(.bottom, equalTo: descriptionLabel, .top, constant: -8)
            .center(.xAxis, with: contentView, constant: 0)
        
        descriptionLabel.layout
            .make(.bottom, equalTo: contentView, .bottom, constant: -150)
            .center(.xAxis, with: contentView, constant: 0)
    }
    
}
