//
//  Presenter.swift
//  Business
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

public protocol Presenter: AnyObject {
    
    func push(_ screen: Screen)
    func present(_ screen: Screen)
    
    func present(_ viewController: UIViewController) 
    
}
