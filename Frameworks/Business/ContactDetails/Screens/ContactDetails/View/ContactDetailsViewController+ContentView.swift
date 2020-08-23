//
//  ContactDetailsViewController+ContentView.swift
//  ContactDetails
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import ContactsKit
import Foundation
import UIKit
import ViewLayout

extension ContactDetailsViewController {
    
    final class ContentView: UIScrollView {
        
        // MARK: - Properties
        
        private let contentView = UIView()
        
        private let avatarView = AvatarView(kind: .large)
        private let nameLabel = HeadlineLabel()
        private let nationalityLabel = CalloutLabel()
        
        private let numbersTitleLabel = HeadlineLabel()
        private let phoneNumberLabel = BodyLabel()
        private let cellNumberLabel = BodyLabel()
        private let numbersSeparator = Separator()
        
        private let emailsTitleLabel = HeadlineLabel()
        private let emailLabel = BodyLabel()
        private let emailsSeparator = Separator()
        
        private let addressTitleLabel = HeadlineLabel()
        private let streetLabel = BodyLabel()
        private let cityLabel = BodyLabel()
        private let stateLabel = BodyLabel()
        private let addressSeparator = Separator()
        
        // MARK: - Initializers
        
        init() {
            super.init(frame: .zero)
            
            setupComponents()
            setupLayout()
        }
        
        required init?(coder: NSCoder) { nil }
        
        // MARK: - Lifecycle
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            nameLabel.preferredMaxLayoutWidth = bounds.width - 24 - 24
            streetLabel.preferredMaxLayoutWidth = bounds.width - 24 - 24
            cityLabel.preferredMaxLayoutWidth = bounds.width - 24 - 24
            stateLabel.preferredMaxLayoutWidth = bounds.width - 24 - 24
        }
        
        // MARK: - API
        
        func bind(with data: ContactProjection) {
            avatarView.bind(with: data.avatar)
            nameLabel.text = data.name
            nationalityLabel.text = data.nationality
            
            phoneNumberLabel.text = data.phoneNumber
            cellNumberLabel.text = data.cellNumber
            
            emailLabel.text = data.emailAddress
            
            streetLabel.text = data.street
            cityLabel.text = data.city
            stateLabel.text = data.country
        }
        
        // MARK: - Methods
        
        private func setupComponents() {
            backgroundColor = .white
            alwaysBounceVertical = true
            
            nameLabel.textAlignment = .center
            nationalityLabel.textAlignment = .center
            
            numbersTitleLabel.text = "Phone numbers:"
            emailsTitleLabel.text = "E-mails:"
            addressTitleLabel.text = "Addresses"
        }
        
        private func setupLayout() {
            contentView.layout
                .add(to: self)
                .embed(in: self)
                .width(equalTo: self, .width)
                .add(subviews: avatarView, nameLabel, nationalityLabel)
            
            avatarView.layout
                .make(.top, equalTo: contentView, .top, constant: 16)
                .center(.xAxis, with: contentView, constant: 0)
            
            nameLabel.layout
                .make(.top, equalTo: avatarView, .bottom, constant: 8)
                .make(.leading, equalTo: contentView, .leading, constant: 24)
                .make(.trailing, equalTo: contentView, .trailing, constant: -24)
            
            nationalityLabel.layout
                .make(.top, equalTo: nameLabel, .bottom, constant: 2)
                .make(.leading, equalTo: contentView, .leading, constant: 24)
                .make(.trailing, equalTo: contentView, .trailing, constant: -24)
            
            let numbersValuesContainer = UIStackView(arrangedVertically: phoneNumberLabel, cellNumberLabel)
            numbersValuesContainer.directionalLayoutMargins.leading = 16
            numbersValuesContainer.isLayoutMarginsRelativeArrangement = true
            let numbersContainer = UIStackView(arrangedVertically: numbersTitleLabel, numbersValuesContainer, numbersSeparator)
            
            let emailsValuesContainer = UIStackView(arrangedVertically: emailLabel)
            emailsValuesContainer.directionalLayoutMargins.leading = 16
            emailsValuesContainer.isLayoutMarginsRelativeArrangement = true
            let emailsContainer = UIStackView(arrangedVertically: emailsTitleLabel, emailsValuesContainer, emailsSeparator)
            
            let addressesValuesContainer = UIStackView(arrangedVertically: streetLabel, cityLabel, stateLabel)
            addressesValuesContainer.directionalLayoutMargins.leading = 16
            addressesValuesContainer.isLayoutMarginsRelativeArrangement = true
            let addressesContainer = UIStackView(arrangedVertically: addressTitleLabel, addressesValuesContainer, addressSeparator)
            
            [numbersContainer, emailsContainer, addressesContainer].forEach { container in container.spacing = 4 }
            
            let dataContainer = UIStackView(arrangedVertically: numbersContainer, emailsContainer, addressesContainer)
            dataContainer.spacing = 14
            
            dataContainer.layout
                .add(to: contentView)
                .make(.top, equalTo: nationalityLabel, .bottom, constant: 48)
                .make(.leading, equalTo: contentView, .leading, constant: 24)
                .make(.trailing, equalTo: contentView, .trailing, constant: -24)
                .make(.bottom, equalTo: contentView, .bottom, constant: -24)
        }
        
    }
    
}
