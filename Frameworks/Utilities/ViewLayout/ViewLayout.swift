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
    public func make(_ anchor: LayoutAnchor.XAxis, equalTo sibling: UIView, _ siblingAnchor: LayoutAnchor.XAxis, constant: CGFloat) -> Self {
        switch (anchor, siblingAnchor) {
        case (.leading, .leading): activate(view.leadingAnchor.constraint(equalTo: sibling.leadingAnchor, constant: constant))
        case (.trailing, .trailing): activate(view.trailingAnchor.constraint(equalTo: sibling.trailingAnchor, constant: constant))
        case (.leading, .trailing): activate(view.leadingAnchor.constraint(equalTo: sibling.trailingAnchor, constant: constant))
        case (.trailing, .leading): activate(view.trailingAnchor.constraint(equalTo: sibling.leadingAnchor, constant: constant))
        }
        
        return self
    }
    
    @discardableResult
    public func make(_ anchor: LayoutAnchor.YAxis, equalTo sibling: UIView, _ siblingAnchor: LayoutAnchor.YAxis, constant: CGFloat) -> Self {
        switch (anchor, siblingAnchor) {
        case (.top, .top): activate(view.topAnchor.constraint(equalTo: sibling.topAnchor, constant: constant))
        case (.bottom, .bottom): activate(view.bottomAnchor.constraint(equalTo: sibling.bottomAnchor, constant: constant))
        case (.top, .bottom): activate(view.topAnchor.constraint(equalTo: sibling.bottomAnchor, constant: constant))
        case (.bottom, .top): activate(view.bottomAnchor.constraint(equalTo: sibling.topAnchor, constant: constant))
        }
        
        return self
    }
    
    @discardableResult
    public func make(_ anchor: LayoutAnchor.YAxis, greaterThan sibling: UIView, _ siblingAnchor: LayoutAnchor.YAxis, constant: CGFloat) -> Self {
        switch (anchor, siblingAnchor) {
        case (.top, .top): activate(view.topAnchor.constraint(greaterThanOrEqualTo: sibling.topAnchor, constant: constant))
        case (.bottom, .bottom): activate(view.bottomAnchor.constraint(greaterThanOrEqualTo: sibling.bottomAnchor, constant: constant))
        case (.top, .bottom): activate(view.topAnchor.constraint(greaterThanOrEqualTo: sibling.bottomAnchor, constant: constant))
        case (.bottom, .top): activate(view.bottomAnchor.constraint(greaterThanOrEqualTo: sibling.topAnchor, constant: constant))
        }
        
        return self
    }
    
    @discardableResult
    public func make(_ anchor: LayoutAnchor.YAxis, lessThan sibling: UIView, _ siblingAnchor: LayoutAnchor.YAxis, constant: CGFloat) -> Self {
        switch (anchor, siblingAnchor) {
        case (.top, .top): activate(view.topAnchor.constraint(lessThanOrEqualTo: sibling.topAnchor, constant: constant))
        case (.bottom, .bottom): activate(view.bottomAnchor.constraint(lessThanOrEqualTo: sibling.bottomAnchor, constant: constant))
        case (.top, .bottom): activate(view.topAnchor.constraint(lessThanOrEqualTo: sibling.bottomAnchor, constant: constant))
        case (.bottom, .top): activate(view.bottomAnchor.constraint(lessThanOrEqualTo: sibling.topAnchor, constant: constant))
        }
        
        return self
    }
    
    @discardableResult
    public func center(_ axis: LayoutAnchor.Axis, with sibling: UIView, constant: CGFloat) -> Self {
        switch axis {
        case .xAxis: activate(view.centerXAnchor.constraint(equalTo: sibling.centerXAnchor, constant: constant))
        case .yAxis: activate(view.centerYAnchor.constraint(equalTo: sibling.centerYAnchor, constant: constant))
        }
        
        return self
    }
    
    @discardableResult
    public func width(equalTo sibling: UIView, _ anchor: LayoutAnchor.Dimension, multiplier: CGFloat = 1) -> Self {
        let constraint: NSLayoutConstraint
        
        switch anchor {
        case .height: constraint = view.widthAnchor.constraint(equalTo: sibling.heightAnchor, multiplier: multiplier)
        case .width: constraint = view.widthAnchor.constraint(equalTo: sibling.widthAnchor, multiplier: multiplier)
        }
        
        constraint.isActive = true
        
        return self
    }
    
    // MARK: - Methods
    
    private func activate(_ constraint: NSLayoutConstraint) {
        constraint.isActive = true
    }
    
}
