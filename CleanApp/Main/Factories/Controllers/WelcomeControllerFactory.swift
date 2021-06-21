//
//  LoginControllerFactory.swift
//  Main
//
//  Created by Heitor Novais | Gerencianet on 21/06/21.
//

import Foundation
import UI
import Presentation
import Validation
import Domain

public func makeWelcomeController(nav: NavigationController) -> WelcomeViewController {
    let router = WelcomeRouter(nav: nav, loginFactory: makeLoginController, signUpFactory: makeSignUpController)
    let controller = WelcomeViewController.instantiate()
    controller.signUp = router.gotoSignUp
    controller.login = router.gotoLogin
    return controller
}
