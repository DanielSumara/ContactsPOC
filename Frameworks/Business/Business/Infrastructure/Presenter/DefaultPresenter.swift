//
//  DefaultPresenter.swift
//  Business
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Extensions
import UIKit
import Utilities

public final class DefaultPresenter: Presenter {
    
    // MARK: - Getters
    
    public var viewController: UIViewController { navigationController }
    
    // MARK: - Properties
    
    private let navigationController = UINavigationController()
    private let navigationDelegate = NavigationControllerDelegate()
    
    private let screenAppearEmitter = EventEmitter<Screen>()
    
    private var screensOnStack: [Screen] = []
    private var screensModally: [Screen] = []
    
    // MARK: - Initializers
    
    public init() {
        navigationController.navigationBar.prefersLargeTitles = true
        
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.barTintColor = .white
        navigationController.navigationBar.isTranslucent = true
        navigationController.navigationBar.accessibilityIdentifier = "NavigationBar"
        
        navigationController.delegate = navigationDelegate
        
        navigationDelegate.didShow = { [weak self] viewController in self?.releaseScreens(after: viewController) }
    }
    
    // MARK: - API
    
    public func push(_ screen: Screen) {
        screensOnStack.append(screen)
        navigationController.pushViewController(screen.viewController, animated: navigationController.viewControllers.isNotEmpty)
    }
    
    public func present(_ screen: Screen) {
        screensModally.append(screen)
        navigationController.present(screen.viewController, animated: true)
    }
    
    public func present(_ viewController: UIViewController) {
        navigationController.present(viewController, animated: true)
    }
    
    public func observeAppearance<ObserverType: AnyObject>(of screen: Screen, on observer: ObserverType, action: @escaping (ObserverType) -> Void) {
        screenAppearEmitter.observe(on: observer) { observer, appearedScreen in
            if appearedScreen === screen {
                action(observer)
            }
        }
    }
    
    // MARK: - Methods
    
    private func releaseScreens(after viewController: UIViewController) {
        guard let index = screensOnStack.lastIndex(where: { screen in screen.viewController === viewController }) else {
            return assertionFailure("\(viewController) is not part of Presenter stack")
        }
        
        screenAppearEmitter.notify(using: screensOnStack[index])
        
        screensOnStack.removeSubrange(index.advanced(by: 1)...)
    }
    
}
