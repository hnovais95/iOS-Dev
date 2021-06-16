//
//  UITests.swift
//  UITests
//
//  Created by Heitor Novais | Gerencianet on 16/06/21.
//

import XCTest
import UIKit
@testable import UI
import Presentation

class SignUpViewControllerTests: XCTestCase {

    func test_loading_is_hidden_on_start() {
        XCTAssertEqual(makeSut().loadingIndicator.isAnimating, false)
    }
    
    func test_sut_implements_loadingView() {
        XCTAssertNotNil(makeSut() as LoadingView)
    }
    
    func test_sut_implements_alertView() {
        XCTAssertNotNil(makeSut() as AlertView)
    }
    
    func test_saveButton_calls_signUp_on_tap() {
        var signUpViewModel: SignUpViewModel?
        let sut = makeSut(signUpSpy: { signUpViewModel = $0 })
        sut.saveButton?.simulateTap()
        
        let name = sut.nameTextField.text
        let email = sut.emailTextField.text
        let password = sut.passwordTextField.text
        let passwordConfirmation = sut.passwordConfirmation.text
        
        XCTAssertEqual(signUpViewModel, SignUpViewModel(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation))
    }
}

extension SignUpViewControllerTests {
    
    func makeSut(signUpSpy: ((SignUpViewModel) -> Void)? = nil) -> SignUpViewController {
        let sb = UIStoryboard(name: "SignUp", bundle: Bundle(for: SignUpViewController.self))
        let sut = sb.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        sut.signUp = signUpSpy
        sut.loadViewIfNeeded()
        return sut
    }
}
