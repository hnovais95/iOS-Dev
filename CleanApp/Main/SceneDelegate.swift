//
//  SceneDelegate.swift
//  Main
//
//  Created by Heitor Novais | Gerencianet on 17/06/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = SignUpComposer.composeWith(addAccount: UseCaseFactory.makeRemoteAddAccount())
        window?.makeKeyAndVisible()
    }
}
