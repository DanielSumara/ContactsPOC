//
//  ContactsListViewController+ContentView.swift
//  ContactsList
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

extension ContactsListViewController {
    
    final class ContentView: UIScrollView {
        
        // MARK: - Initializers
        
        init() {
            super.init(frame: .zero)
            
            setupComponents()
            setupLayout()
        }
        
        required init?(coder: NSCoder) { nil }
        
        // MARK: - Methods
        
        private func setupComponents() {
            backgroundColor = .white
            
            alwaysBounceVertical = true
        }
        
        private func setupLayout() {
            
        }
        
    }
    
}
