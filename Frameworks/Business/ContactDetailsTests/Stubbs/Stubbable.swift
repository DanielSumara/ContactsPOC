//
//  Stubbable.swift
//  ContactDetailsTests
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

protocol Stubbable {
    
    func stub<Type>(of type: Type) -> Type
    func getter<Type>(for type: Type.Type) -> () -> Type
    
}

extension Stubbable {
    
    func stub<Type>(of type: Type) -> Type { nil! }
    func getter<Type>(for type: Type.Type) -> () -> Type { nil! }
    
}
