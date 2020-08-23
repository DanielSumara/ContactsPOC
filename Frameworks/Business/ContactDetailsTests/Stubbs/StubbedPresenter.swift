//
//  StubbedPresenter.swift
//  ContactDetailsTests
//
//  Created by Daniel Sumara on 23/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Business
import Foundation
import UIKit

final class StubbedPresenter: Presenter, Stubbable {
    
    // MARK: - Stubs
    
    lazy var pushScreenStub = stub(of: push)
    lazy var presentScreenStub: (Screen) -> Void = stub(of: present)
    lazy var presentViewControllerStub: (UIViewController) -> Void = stub(of: present)
    
    // MARK: - API
    
    func push(_ screen: Screen) {
        pushScreenStub(screen)
    }
    
    func present(_ screen: Screen) {
        presentScreenStub(screen)
    }
    
    func present(_ viewController: UIViewController) {
        presentViewControllerStub(viewController)
    }
    
    func observeAppearance<ObserverType : AnyObject>(of screen: Screen, on observer: ObserverType, action: @escaping (ObserverType) -> Void)  {
        fatalError("Not implemented")
    }
    
}
