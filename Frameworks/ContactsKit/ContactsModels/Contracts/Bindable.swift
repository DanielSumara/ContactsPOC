//
//  Bindable.swift
//  ContactsModels
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public protocol Bindable {

    associatedtype ModelType

    func bind(with data: ModelType)

}
