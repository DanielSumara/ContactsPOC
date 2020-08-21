//
//  Icons.swift
//  Resources
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

public enum Icons {
    
    public static let star: UIImage = UIImage(named: "Star", in: Bundle(for: ClassForBundle.self), compatibleWith: nil)!
    public static let starFilled: UIImage = UIImage(named: "StarFilled", in: Bundle(for: ClassForBundle.self), compatibleWith: nil)!
    
}

extension Icons {
    
    private final class ClassForBundle {}
    
}
