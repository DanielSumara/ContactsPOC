//
//  FootnoteLabel.swift
//  ContactsKit
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import Resources
import UIKit

public final class FootnoteLabel: UILabel {
    
    // MARK: - Initializers
    
    override public init(frame: CGRect) {
        super.init(frame: .zero)
        
        font = .preferredFont(forTextStyle: .footnote)
        textColor = Colors.darkGray
        
        numberOfLines = 1
    }
    
    public required init?(coder: NSCoder) { nil }
    
}
