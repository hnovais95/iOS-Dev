//
//  WelcomeRouterTests.swift
//  UITests
//
//  Created by Heitor Novais | Gerencianet on 21/06/21.
//

import XCTest
import UIKit
@testable import UI

class WelcomeRouter {
    
    private let nav: NavigationController
    private let loginFactory: () -> LoginViewController
    
    public init(nav: NavigationController, loginFactory: @escaping () -> LoginViewController) {
        self.nav = nav
        self.loginFactory = loginFactory
    }
    
    func gotoLogin() {
        nav.pushViewController(loginFactory())
    }
}

class WelcomeRouterTests: XCTestCase {
    
    func test_gotoLogin_calls_nav_with_correct_vc() {
        let loginFactorySpy = LoginFactorySpy()
        let nav = NavigationController()
        let sut = WelcomeRouter(nav: nav, loginFactory: loginFactorySpy.makeLogin)
        sut.gotoLogin()
        XCTAssertEqual(nav.viewControllers.count, 1)
        XCTAssertTrue(nav.viewControllers[0] is LoginViewController)
    }
    
    class LoginFactorySpy {
        
        func makeLogin() -> LoginViewController {
            return LoginViewController.instantiate()
        }
    }
}
