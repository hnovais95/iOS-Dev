//
//  SceneDelegate.swift
//  Main
//
//  Created by Heitor Novais | Gerencianet on 17/06/21.
//

import UIKit
import UI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let httpClient = makeAlamofireAdapter()
        let authentication = makeRemoteAuthentication(httpClient: httpClient)
        let loginController = makeLoginController(authentication: authentication)
        let nav = NavigationController.init(rootViewController: loginController)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
}

