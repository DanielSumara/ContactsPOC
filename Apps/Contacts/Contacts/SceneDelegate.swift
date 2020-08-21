//
//  SceneDelegate.swift
//  Contacts
//
//  Created by Daniel Sumara on 21/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Properties
    
    private var mainWindow: UIWindow?

    // MARK: - API

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        mainWindow = UIWindow(windowScene: windowScene)
        mainWindow?.backgroundColor = .white
        mainWindow?.makeKeyAndVisible()
    }

}
