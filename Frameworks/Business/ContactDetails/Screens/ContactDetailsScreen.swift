//
//  ContactDetailsScreen.swift
//  ContactDetails
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import Foundation
import UIKit

final class ContactDetailsScreen: Screen {
    
    // MARK: - Properties
    
    let viewController: UIViewController
    
    // MARK: - Initializers
    
    init() {
        viewController = UIViewController()
        viewController.view.backgroundColor = .red
        viewController.title = "Details"
    }
    
}
