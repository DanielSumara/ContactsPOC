//
//  UIStackView+Extensions.swift
//  ContactsKit
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView {
    
    public convenience init(arrangedHorizontally subviews: UIView...) {
        self.init(arrangedSubviews: subviews)
    }
    
    public convenience init(arrangedVertically subviews: UIView...) {
        self.init(arrangedSubviews: subviews)
        axis = .vertical
    }
    
}
