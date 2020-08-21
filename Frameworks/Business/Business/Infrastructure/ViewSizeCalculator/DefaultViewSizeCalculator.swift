//
//  DefaultViewSizeCalculator.swift
//  Business
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import ContactsModels
import UIKit

public final class DefaultViewSizeCalculator: ViewSizeCalculator {
    
    // MARK: - Properties
    
    private var viewCache: [String: UIView] = [:]
    private var dataCache: [HashableBox: CGSize] = [:]
    
    // MARK: - Initializers
    
    public init() {}
    
    // MARK: - API
    
    public func height<ViewType: Bindable & UIView>(of viewType: ViewType.Type, with content: ViewType.ModelType, for width: CGFloat) -> CGSize where ViewType.ModelType: Hashable {
        let box = HashableBox(content)
        
        if let calculatedSize = dataCache[box] {
            return calculatedSize
        }
        
        guard let view = viewCache[ViewType.description()] else {
            viewCache[ViewType.description()] = ViewType()
            return height(of: ViewType.self, with: content, for: width)
        }
        guard let bindableView = view as? ViewType else {
            assertionFailure("Invalid argument")
            return .zero
        }
        
        bindableView.frame.size = CGSize(width: width, height: 250)

        bindableView.bind(with: content)
        
        bindableView.setNeedsLayout()
        bindableView.layoutIfNeeded()
        
        let size = bindableView.systemLayoutSizeFitting(CGSize(width: width, height: UIView.noIntrinsicMetric),
                                                        withHorizontalFittingPriority: .required,
                                                        verticalFittingPriority: .fittingSizeLevel)
        
        dataCache[box] = size
        
        return size
    }
    
}

extension DefaultViewSizeCalculator {
    
    private struct HashableBox: Hashable {
        
        // MARK: - Properties
        
        private let hashIntoHasher: (inout Hasher) -> Void
        private let equalityTest: (HashableBox) -> Bool
        
        private let base: Any
        
        // MARK: - Initializers
        
        init<ObjectType: Hashable>(_ object: ObjectType) {
            base = object
            hashIntoHasher = { hasher in hasher.combine(object) }
            equalityTest = { box in
                guard let rhs = box.base as? ObjectType else { return false }
                return object == rhs
            }
        }
        
        // MARK: - API
        
        func hash(into hasher: inout Hasher) { hashIntoHasher(&hasher) }
        
        static func == (lhs: HashableBox, rhs: HashableBox) -> Bool { lhs.equalityTest(rhs) }
        
    }
    
}
