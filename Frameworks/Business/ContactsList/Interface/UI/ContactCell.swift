//
//  ContactCell.swift
//  ContactsList
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import ContactsKit
import ContactsModels
import Foundation
import UIKit

final class ContactCell: UITableViewCell, Bindable {
    
    // MARK: - Properties
    
    private let avatarView = AvatarView(kind: .thumbnail)
    private let nameLabel = HeadlineLabel()
    private let nationalityLabel = CalloutLabel()
    private let favoriteView = FavoriteView()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupComponents()
        setupLayout()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - API
    
    func bind(with data: ContactProjection) {
        avatarView.bind(with: data.avatar)
        nameLabel.text = data.name
        nationalityLabel.text = data.nationality
        favoriteView.bind(with: data.isFavorite)
    }
    
    // MARK: - Methods
    
    private func setupComponents() {
        selectionStyle = .none
    }
    
    private func setupLayout() {
        let card = CardView()
        
        card.layout.add(to: contentView)
            .make(.top, equalTo: contentView, .top, constant: 2)
            .make(.leading, equalTo: contentView, .leading, constant: 8)
            .make(.trailing, equalTo: contentView, .trailing, constant: -8)
            .make(.bottom, equalTo: contentView, .bottom, constant: -2)
        
        card.layout.add(subviews: avatarView, nameLabel, nationalityLabel, favoriteView)
        
        avatarView.layout
            .make(.top, equalTo: card, .top, constant: 8)
            .make(.leading, equalTo: card, .leading, constant: 8)
            .make(.bottom, lessThan: card, .bottom, constant: -8)
        
        nameLabel.layout
            .make(.top, equalTo: card, .top, constant: 12)
            .make(.leading, equalTo: avatarView, .trailing, constant: 24)
            .make(.trailing, equalTo: favoriteView, .leading, constant: -16)
        
        nationalityLabel.layout
            .make(.top, equalTo: nameLabel, .bottom, constant: 0)
            .make(.leading, equalTo: avatarView, .trailing, constant: 24)
            .make(.trailing, equalTo: favoriteView, .leading, constant: -16)
            .make(.bottom, lessThan: card, .bottom, constant: -8)
        
        favoriteView.layout
            .make(.top, equalTo: card, .top, constant: 12)
            .make(.trailing, equalTo: card, .trailing, constant: -8)
    }
    
}
