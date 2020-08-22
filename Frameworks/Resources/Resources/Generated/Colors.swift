//
//  Colors.swift
//  Resources
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

public enum Colors {
    
    public static let lightGray: UIColor = UIColor(named: "LightGray", in: Bundle(for: ClassForBundle.self), compatibleWith: nil)!
    public static let midGray: UIColor = UIColor(named: "MidGray", in: Bundle(for: ClassForBundle.self), compatibleWith: nil)!
    public static let darkGray: UIColor = UIColor(named: "DarkGray", in: Bundle(for: ClassForBundle.self), compatibleWith: nil)!
    
}

extension Colors {
    
    private final class ClassForBundle {}
    
}

