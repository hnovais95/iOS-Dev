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
    
    private let signUpFactory: () -> SignUpViewController = {
        let remoteAddAccount = makeRemoteAddAccount(httpClient: makeAlamofireAdapter())
        return makeSignUpController(addAccount: remoteAddAccount)
    }
    
    private let loginFactory: () -> LoginViewController = {
        let remoteAuthentication = makeRemoteAuthentication(httpClient: makeAlamofireAdapter())
        return makeLoginController(authentication: remoteAuthentication)
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let nav = NavigationController()
        let welcomeRouter = WelcomeRouter(nav: nav, loginFactory: loginFactory, signUpFactory: signUpFactory)
        let welcomeViewController = WelcomeViewController.instantiate()
        welcomeViewController.signUp = welcomeRouter.gotoSignUp
        welcomeViewController.login = welcomeRouter.gotoLogin
        nav.setRootViewController(welcomeViewController)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
}

