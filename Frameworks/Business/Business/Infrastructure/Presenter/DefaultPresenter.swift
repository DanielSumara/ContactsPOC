//
//  DefaultPresenter.swift
//  Business
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Extensions
import UIKit

public final class DefaultPresenter: Presenter {
    
    // MARK: - Getters
    
    public var viewController: UIViewController { navigationController }
    
    // MARK: - Properties
    
    private let navigationController = UINavigationController()
    private let navigationDelegate = NavigationControllerDelegate()
    
    private var screensOnStack: [Screen] = []
    private var screensModally: [Screen] = []
    
    // MARK: - Initializers
    
    public init() {
        navigationController.navigationBar.prefersLargeTitles = true
        
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.barTintColor = .white
        navigationController.navigationBar.isTranslucent = true
        
        navigationController.delegate = navigationDelegate
        
        navigationDelegate.didShow = { [weak self] viewController in self?.releaseScreens(after: viewController) }
    }
    
    // MARK: - API
    
    public func push(_ screen: Screen) {
        screensOnStack.append(screen)
        navigationController.pushViewController(screen.viewController, animated: navigationController.viewControllers.isNotEmpty )
    }
    
    public func present(_ screen: Screen) {
        screensModally.append(screen)
        navigationController.present(screen.viewController, animated: true)
    }
    
    // MARK: - Methods
    
    private func releaseScreens(after viewController: UIViewController) {
        guard let index = screensOnStack.lastIndex(where: { screen in screen.viewController === viewController }) else {
            return assertionFailure("\(viewController) is not part of Presenter stack")
        }
        screensOnStack.removeSubrange(index.advanced(by: 1)...)
    }
    
}
