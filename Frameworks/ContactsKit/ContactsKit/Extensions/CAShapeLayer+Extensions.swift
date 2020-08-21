//
//  CAShapeLayer+Extensions.swift
//  ContactsKit
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import UIKit

extension CAShapeLayer {

    convenience init(path: CGPath) {
        self.init()
        self.path = path
    }

}
