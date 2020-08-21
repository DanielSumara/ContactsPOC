//
//  ViewLayout.swift
//  ViewLayout
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation
import UIKit

public struct ViewLayout {

    // MARK: - Properties

    private let view: UIView

    // MARK: - Initializers

    public init(of view: UIView) {
        self.view = view
    }

    // MARK: - API

    @discardableResult
    public func add(to parent: UIView) -> Self {
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    @discardableResult
    public func add(subviews: UIView...) -> Self {
        subviews.forEach { subview in
            view.addSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        return self
    }
    
    @discardableResult
    public func embed(in parent: UIView) -> Self {
        view.topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: parent.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
        
        return self
    }
    
    @discardableResult
    public func connect(_ anchor: LayoutAnchor.XAxis, to sibling: UIView, _ siblingAnchor: LayoutAnchor.XAxis, constant: CGFloat, priority: UILayoutPriority?) -> Self {
        switch (anchor, siblingAnchor) {
        case (.leading, .leading): activate(view.leadingAnchor.constraint(equalTo: sibling.leadingAnchor, constant: constant), with: priority)
        case (.trailing, .trailing): activate(view.trailingAnchor.constraint(equalTo: sibling.trailingAnchor, constant: constant), with: priority)
        case (.leading, .trailing): activate(view.leadingAnchor.constraint(equalTo: sibling.trailingAnchor, constant: constant), with: priority)
        case (.trailing, .leading): activate(view.trailingAnchor.constraint(equalTo: sibling.leadingAnchor, constant: constant), with: priority)
        }
        
        return self
    }
    
    @discardableResult
    public func connect(_ anchor: LayoutAnchor.YAxis, to sibling: UIView, _ siblingAnchor: LayoutAnchor.YAxis, constant: CGFloat, priority: UILayoutPriority?) -> Self {
        switch (anchor, siblingAnchor) {
        case (.top, .top): activate(view.topAnchor.constraint(equalTo: sibling.topAnchor, constant: constant), with: priority)
        case (.bottom, .bottom): activate(view.bottomAnchor.constraint(equalTo: sibling.bottomAnchor, constant: constant), with: priority)
        case (.top, .bottom): activate(view.topAnchor.constraint(equalTo: sibling.bottomAnchor, constant: constant), with: priority)
        case (.bottom, .top): activate(view.bottomAnchor.constraint(equalTo: sibling.topAnchor, constant: constant), with: priority)
        }
            
        return self
    }
    
    @discardableResult
    public func make(_ anchor: LayoutAnchor.YAxis, greaterThan sibling: UIView, _ siblingAnchor: LayoutAnchor.YAxis, constant: CGFloat, priority: UILayoutPriority?) -> Self {
        switch (anchor, siblingAnchor) {
        case (.top, .top): activate(view.topAnchor.constraint(greaterThanOrEqualTo: sibling.topAnchor, constant: constant), with: priority)
        case (.bottom, .bottom): activate(view.bottomAnchor.constraint(greaterThanOrEqualTo: sibling.bottomAnchor, constant: constant), with: priority)
        case (.top, .bottom): activate(view.topAnchor.constraint(greaterThanOrEqualTo: sibling.bottomAnchor, constant: constant), with: priority)
        case (.bottom, .top): activate(view.bottomAnchor.constraint(greaterThanOrEqualTo: sibling.topAnchor, constant: constant), with: priority)
        }
            
        return self
    }
    
    @discardableResult
    public func make(_ anchor: LayoutAnchor.YAxis, lessThan sibling: UIView, _ siblingAnchor: LayoutAnchor.YAxis, constant: CGFloat, priority: UILayoutPriority?) -> Self {
        switch (anchor, siblingAnchor) {
        case (.top, .top): activate(view.topAnchor.constraint(lessThanOrEqualTo: sibling.topAnchor, constant: constant), with: priority)
        case (.bottom, .bottom): activate(view.bottomAnchor.constraint(lessThanOrEqualTo: sibling.bottomAnchor, constant: constant), with: priority)
        case (.top, .bottom): activate(view.topAnchor.constraint(lessThanOrEqualTo: sibling.bottomAnchor, constant: constant), with: priority)
        case (.bottom, .top): activate(view.bottomAnchor.constraint(lessThanOrEqualTo: sibling.topAnchor, constant: constant), with: priority)
        }
            
        return self
    }
    
    // MARK: - Methods
    
    private func activate(_ constraint: NSLayoutConstraint, with priority: UILayoutPriority?) {
        if let priority = priority {
            constraint.priority = priority
        }
        constraint.isActive = true
    }
    
}
