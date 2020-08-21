//
//  LayoutAnchor.swift
//  ViewLayout
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public enum LayoutAnchor {}

extension LayoutAnchor {
    
    public enum Axis {
        
        case xAxis
        case yAxis
        
    }
    
    public enum Dimension {
        
        case width
        case height
        
    }
    
    public enum XAxis {
        
        case leading
        case trailing
        
    }
    
    public enum YAxis {
        
        case top
        case bottom
        
    }
    
}
