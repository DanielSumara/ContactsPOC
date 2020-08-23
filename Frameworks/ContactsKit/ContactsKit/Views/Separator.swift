//
//  Separator.swift
//  ContactsKit
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import Resources
import UIKit

public final class Separator: UIView {
    
    // MARK: - Getters
    
    public override var intrinsicContentSize: CGSize { CGSize(width: UIView.noIntrinsicMetric, height: 1) }
    
    // MARK: - Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.midGray
        
        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    public required init?(coder: NSCoder) { nil }
    
}
