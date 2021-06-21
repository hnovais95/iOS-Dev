//
//  PresentationTests.swift
//  PresentationTests
//
//  Created by Heitor Novais | Gerencianet on 15/06/21.
//

import XCTest
import Presentation
import Domain

class LoginPresenterTests: XCTestCase {
    
    func test_login_should_call_validation_with_correct_values() {
        let validationSpy = ValidationSpy()
        let sut = makeSut(validation: validationSpy)
        let viewModel = makeLoginViewModel()
        sut.login(viewModel: viewModel)
        XCTAssertTrue(NSDictionary(dictionary: validationSpy.data!).isEqual(to: viewModel.toJson()!))
    }
    
    func test_login_should_show_error_message_if_validation_fails() {
        let alertViewSpy = AlertViewSpy()
        let validationSpy = ValidationSpy()
        let sut = makeSut(alertView: alertViewSpy, validation: validationSpy)
        let exp = expectation(description: "waiting")
        alertViewSpy.observer { viewModel in
            XCTAssertEqual(viewModel, AlertViewModel(title: "Falha na validação", message: "Erro"))
            exp.fulfill()
        }
        validationSpy.simulateError()
        sut.login(viewModel: makeLoginViewModel())
        wait(for: [exp], timeout: 1)
    }
    
    func test_login_should_call_authentication_with_correct_values() {
        let authenticationSpy = AuthenticationSpy()
        let sut = makeSut(authentication: authenticationSpy)
        sut.login(viewModel: makeLoginViewModel())
        XCTAssertEqual(authenticationSpy.authenticationModel, makeAuthenticationModel())
    }
}

extension LoginPresenterTests {
    
    func makeSut(alertView: AlertView = AlertViewSpy(), authentication: AuthenticationSpy = AuthenticationSpy(), validation: ValidationSpy = ValidationSpy(), file: StaticString = #file, line: UInt = #line) -> LoginPresenter {
        let sut = LoginPresenter(alertView: alertView, authentication: authentication, validation: validation)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}
