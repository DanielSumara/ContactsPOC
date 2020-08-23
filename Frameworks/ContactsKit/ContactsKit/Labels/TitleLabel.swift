//
//  TitleLabel.swift
//  ContactsKit
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

public final class TitleLabel: UILabel {
    
    // MARK: - Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        
        font = .preferredFont(forTextStyle: .title2)
    }
    
    public required init?(coder: NSCoder) { nil }
    
}
