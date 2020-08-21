//
//  CardView.swift
//  ContactsKit
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import Resources
import UIKit

public final class CardView: UIView {
    
    // MARK: - Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = Colors.lightGray
    }
    
    public required init?(coder: NSCoder) { nil }
    
    // MARK: - Lifecycle
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 16, height: 16))
        layer.mask = CAShapeLayer(path: path.cgPath)
    }
    
}
