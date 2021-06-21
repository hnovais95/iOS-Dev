//
//  WelcomeRouterTests.swift
//  UITests
//
//  Created by Heitor Novais | Gerencianet on 21/06/21.
//

import XCTest
import UIKit
@testable import UI

class WelcomeRouterTests: XCTestCase {
    
    func test_gotoLogin_calls_nav_with_correct_vc() {
        let (sut, nav) = makeSut()
        sut.gotoLogin()
        XCTAssertEqual(nav.viewControllers.count, 1)
        XCTAssertTrue(nav.viewControllers[0] is LoginViewController)
    }
    
    func test_gotoSignUp_calls_nav_with_correct_vc() {
        let (sut, nav) = makeSut()
        sut.gotoSignUp()
        XCTAssertEqual(nav.viewControllers.count, 1)
        XCTAssertTrue(nav.viewControllers[0] is SignUpViewController)
    }
}

extension WelcomeRouterTests {
    
    func makeSut() -> (WelcomeRouter, NavigationController) {
        let loginFactorySpy = LoginFactorySpy()
        let signUpFactorySpy = SignUpFactorySpy()
        let nav = NavigationController()
        let sut = WelcomeRouter(nav: nav, loginFactory: loginFactorySpy.makeLogin, signUpFactory: signUpFactorySpy.makeSignUp)
        return (sut, nav)
    }
    
    class LoginFactorySpy {
        
        func makeLogin() -> LoginViewController {
            return LoginViewController.instantiate()
        }
    }
    
    class SignUpFactorySpy {
        
        func makeSignUp() -> SignUpViewController {
            return SignUpViewController.instantiate()
        }
    }
}
