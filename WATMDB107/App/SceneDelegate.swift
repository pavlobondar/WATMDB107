//
//  SceneDelegate.swift
//  WATMDB107
//
//  Created by Pavlo on 07.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var coordinator: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let navigationController = UINavigationController()
        navigationController.navigationItem.largeTitleDisplayMode = .always
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.isTranslucent = true
        
        coordinator = MainCoordinator(navigationController: navigationController)
        coordinator?.start()
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

