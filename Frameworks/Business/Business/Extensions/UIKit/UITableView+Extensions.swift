//
//  UITableView+Extensions.swift
//  Business
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import ContactsModels
import Foundation
import UIKit

extension UITableView {

    public func register<ContentType: Bindable & UITableViewCell>(_ type: ContentType.Type) {
        register(type, forCellReuseIdentifier: type.description())
    }

    public func dequeue<ContentType: Bindable & UITableViewCell>(_ type: ContentType.Type, at indexPath: IndexPath, with data: ContentType.ModelType) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: type.description(), for: indexPath) as? ContentType else {
            preconditionFailure("Unable to cast cell instance to \(type)")
        }
        cell.bind(with: data)
        return cell
    }

}
