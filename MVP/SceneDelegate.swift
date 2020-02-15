//
//  SceneDelegate.swift
//  MVP
//
//  Created by Valentino Urbano on 22/01/2020.
//  Copyright © 2020 Valentino Urbano. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let vc = setupInitialController()
            window.rootViewController = vc
        }
    }

    private func setupInitialController() -> UIViewController {
        let presenter = Presenter()
        let vc = ViewController(presenter: presenter)
        presenter.userInterface = vc
        return vc
    }
}

