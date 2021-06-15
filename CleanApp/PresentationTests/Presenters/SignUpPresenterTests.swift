//
//  PresentationTests.swift
//  PresentationTests
//
//  Created by Heitor Novais | Gerencianet on 15/06/21.
//

import XCTest
import Presentation

class SignUpPresenterTests: XCTestCase {

    func test_signUp_should_show_error_message_if_name_not_privaded() {
        let (sut, alertViewSpy) = makeSut()
        let signUpViewModel = makeViewModelWithoutName()
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo Nome é obrigatório."))
    }
    
    func test_signUp_should_show_error_message_if_email_not_privaded() {
        let (sut, alertViewSpy) = makeSut()
        let signUpViewModel = makeViewModelWithoutEmail()
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo Email é obrigatório."))
    }
    
    func test_signUp_should_show_error_message_if_password_not_privaded() {
        let (sut, alertViewSpy) = makeSut()
        let signUpViewModel = makeViewModelWithoutPassword()
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo Senha é obrigatório."))
    }
    
    func test_signUp_should_show_error_message_if_password_confirmation_not_privaded() {
        let (sut, alertViewSpy) = makeSut()
        let signUpViewModel = makeViewModelWithoutPasswordConfirmation()
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo Confirmar Senha é obrigatório."))
    }
    
    func test_signUp_should_show_error_message_if_password_confirmation_not_match() {
        let (sut, alertViewSpy) = makeSut()
        let signUpViewModel = makeViewModelWithPasswordConfirmationNotMatch()
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Falha ao confirmar senha."))
    }
}

extension SignUpPresenterTests {
    
    func makeSut() -> (SignUpPresenter, AlertViewSpy) {
        let alertViewSpy = AlertViewSpy()
        let sut = SignUpPresenter(alertView: alertViewSpy)
        return (sut, alertViewSpy)
    }
    
    func makeValidViewModel() -> SignUpViewModel {
        return SignUpViewModel(name: "any_name", email: "any_email@domain.com", password: "secret", passwordConfirmation: "secret")
    }
    
    func makeViewModelWithoutName() -> SignUpViewModel {
        return SignUpViewModel(email: "any_email@domain.com", password: "secret", passwordConfirmation: "secret")
    }
    
    func makeViewModelWithoutEmail() -> SignUpViewModel {
        return SignUpViewModel(name: "Gorbadock Oldbuck", password: "secret", passwordConfirmation: "secret")
    }
    
    func makeViewModelWithoutPassword() -> SignUpViewModel {
        return SignUpViewModel(name: "Gorbadock Oldbuck", email: "any_email@domain.com", passwordConfirmation: "secret")
    }
    
    func makeViewModelWithoutPasswordConfirmation() -> SignUpViewModel {
        return SignUpViewModel(name: "Gorbadock Oldbuck", email: "any_email@domain.com", password: "secret")
    }
    
    func makeViewModelWithPasswordConfirmationNotMatch() -> SignUpViewModel {
        return SignUpViewModel(name: "any_name", email: "any_email@domain.com", password: "secret", passwordConfirmation: "wrong_password")
    }
}
