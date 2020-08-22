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
    private let nameLabel = TitleLabel()
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
    
    func bind(with data: Int) {
        avatarView.bind(with: .initials("DS"))
        nameLabel.text = "Daniel Sumara"
        nationalityLabel.text = "🇵🇱 Polska"
    }
    
    // MARK: - Methods
    
    private func setupComponents() {
        selectionStyle = .none
    }
    
    private func setupLayout() {
        let card = CardView()
        
        card.layout.add(to: contentView)
            .make(.top, equalTo: contentView, .top, constant: 2, priority: nil)
            .make(.leading, equalTo: contentView, .leading, constant: 8, priority: nil)
            .make(.trailing, equalTo: contentView, .trailing, constant: -8, priority: nil)
            .make(.bottom, equalTo: contentView, .bottom, constant: -2, priority: nil)
        
        card.layout.add(subviews: avatarView, nameLabel, nationalityLabel, favoriteView)
        
        avatarView.layout
            .make(.top, equalTo: card, .top, constant: 8, priority: nil)
            .make(.leading, equalTo: card, .leading, constant: 16, priority: nil)
            .make(.bottom, lessThan: card, .bottom, constant: -8, priority: nil)
        
        nameLabel.layout
            .make(.top, equalTo: card, .top, constant: 12, priority: nil)
            .make(.leading, equalTo: avatarView, .trailing, constant: 24, priority: nil)
            .make(.trailing, equalTo: favoriteView, .leading, constant: -16, priority: nil)
        
        nationalityLabel.layout
            .make(.top, equalTo: nameLabel, .bottom, constant: 0, priority: nil)
            .make(.leading, equalTo: avatarView, .trailing, constant: 24, priority: nil)
            .make(.trailing, equalTo: favoriteView, .leading, constant: -16, priority: nil)
            .make(.bottom, lessThan: card, .bottom, constant: -8, priority: nil)
        
        favoriteView.layout
            .make(.top, equalTo: card, .top, constant: 12, priority: nil)
            .make(.trailing, equalTo: card, .trailing, constant: -16, priority: nil)
    }
    
}
