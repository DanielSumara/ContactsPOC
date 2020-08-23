//
//  ContactEditFormViewController+ContentView.swift
//  ContactDetails
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import ContactsKit
import Foundation
import UIKit
import ViewLayout

extension ContactEditFormViewController {
    
    final class ContentView: UIView {
        
        // MARK: - Properties
        
        private let titleLabel = TitleLabel()
        private let descriptionLabel = CalloutLabel()
        
        // MARK: - Initializers
        
        init() {
            super.init(frame: .zero)
            
            setupComponents()
            setupLayout()
        }
        
        required init?(coder: NSCoder) { nil }
        
        // MARK: - Methods
        
        private func setupComponents() {
            backgroundColor = .black
            
            titleLabel.text = "You caught us unprepared..."
            titleLabel.textColor = .white
            titleLabel.textAlignment = .center
            
            descriptionLabel.text = "This functionality is under development. We do our best to ship it as fast as possible.\n\nThis time it is prove of modal presentation."
            descriptionLabel.textColor = .white
            descriptionLabel.textAlignment = .center
            descriptionLabel.numberOfLines = 0
        }
        
        private func setupLayout() {
            layout.add(subviews: titleLabel, descriptionLabel)
            
            titleLabel.layout
                .make(.top, equalTo: self, .top, constant: 150)
                .make(.leading, equalTo: self, .leading, constant: 20)
                .make(.trailing, equalTo: self, .trailing, constant: -20)
            
            descriptionLabel.layout
                .make(.top, equalTo: titleLabel, .bottom, constant: 24)
                .make(.leading, equalTo: self, .leading, constant: 48)
                .make(.trailing, equalTo: self, .trailing, constant: -48)
        }
        
    }
    
}
