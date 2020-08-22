//
//  LackOfContacts.swift
//  ContactsList
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import ContactsKit
import ContactsModels
import Foundation
import Resources
import UIKit

final class LackOfContacts: UITableViewCell, Bindable {
    
    // MARK: - Properties
    
    private let descriptionLabel = FootnoteLabel()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupComponents()
        setupLayout()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - API
    
    func bind(with data: Bool) {}
    
    // MARK: - Methods
    
    private func setupComponents() {
        selectionStyle = .none
        descriptionLabel.textAlignment = .center
        descriptionLabel.text = "Lack of contacts to display..."
    }
    
    private func setupLayout() {
        contentView.layout.add(subviews: descriptionLabel)
        
        descriptionLabel.layout
            .make(.top, equalTo: contentView, .top, constant: 150, priority: nil)
            .center(.xAxis, with: contentView, constant: 0, priority: nil)
            .make(.bottom, equalTo: contentView, .bottom, constant: -150, priority: nil)
    }
    
}
