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
        var signUpViewModel: SignUpRequest?
        let sut = makeSut(signUpSpy: { signUpViewModel = $0 })
        sut.saveButton?.simulateTap()
        
        let name = sut.nameTextField.text
        let email = sut.emailTextField.text
        let password = sut.passwordTextField.text
        let passwordConfirmation = sut.passwordConfirmation.text
        
        XCTAssertEqual(signUpViewModel, SignUpRequest(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation))
    }
}

extension SignUpViewControllerTests {
    
    func makeSut(signUpSpy: ((SignUpRequest) -> Void)? = nil, file: StaticString = #filePath, line: UInt = #line) -> SignUpViewController {
        let sut = SignUpViewController.instantiate()
        sut.signUp = signUpSpy
        sut.loadViewIfNeeded()
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}
