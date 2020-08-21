//
//  ViewSizeCalculator.swift
//  Business
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import ContactsModels
import Foundation
import UIKit

public protocol ViewSizeCalculator: AnyObject {
    
    func height<ViewType: Bindable & UIView>(of viewType: ViewType.Type, with content: ViewType.ModelType, for width: CGFloat) -> CGSize where ViewType.ModelType: Hashable
    
}
