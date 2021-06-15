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
        let (sut, alertViewSpy, _) = makeSut()
        let signUpViewModel = makeViewModelWithoutName()
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo Nome é obrigatório."))
    }
    
    func test_signUp_should_show_error_message_if_email_not_privaded() {
        let (sut, alertViewSpy, _) = makeSut()
        let signUpViewModel = makeViewModelWithoutEmail()
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo Email é obrigatório."))
    }
    
    func test_signUp_should_show_error_message_if_password_not_privaded() {
        let (sut, alertViewSpy, _) = makeSut()
        let signUpViewModel = makeViewModelWithoutPassword()
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo Senha é obrigatório."))
    }
    
    func test_signUp_should_show_error_message_if_password_confirmation_not_privaded() {
        let (sut, alertViewSpy, _) = makeSut()
        let signUpViewModel = makeViewModelWithoutPasswordConfirmation()
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo Confirmar Senha é obrigatório."))
    }
    
    func test_signUp_should_show_error_message_if_password_confirmation_not_match() {
        let (sut, alertViewSpy, _) = makeSut()
        let signUpViewModel = makeViewModelWithPasswordConfirmationNotMatch()
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Falha ao confirmar senha."))
    }
    
    func test_signUp_should_call_emailValidator_with_correct_email() {
        let (sut, _, emailValidatorSpy) = makeSut()
        let signUpViewModel = makeValidViewModel()
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(emailValidatorSpy.email, signUpViewModel.email)
    }
    
    func test_signUp_should_show_error_message_if_invalid_email_provided() {
        let (sut, alertViewSpy, emailValidatorSpy) = makeSut()
        let signUpViewModel = makeViewModelWithInvalidEmail()
        emailValidatorSpy.isValid = false
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "Email inválido."))
    }
}

extension SignUpPresenterTests {
    
    func makeSut() -> (SignUpPresenter, AlertViewSpy, EmailValidatorSpy) {
        let alertViewSpy = AlertViewSpy()
        let emailValidatorSpy = EmailValidatorSpy()
        let sut = SignUpPresenter(alertView: alertViewSpy, emailValidator: emailValidatorSpy)
        return (sut, alertViewSpy, emailValidatorSpy)
    }
    
    func makeValidViewModel() -> SignUpViewModel {
        return SignUpViewModel(name: "any_name", email: "any_email@domain.com", password: "secret", passwordConfirmation: "secret")
    }
    
    func makeViewModelWithInvalidEmail() -> SignUpViewModel {
        return SignUpViewModel(name: "any_name", email: "invalid_email@domain.com", password: "secret", passwordConfirmation: "secret")
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
    
    class EmailValidatorSpy: EmailValidator {
        
        var isValid = true
        var email: String?
        
        func isValid(email: String) -> Bool {
            self.email = email
            return isValid
        }
    }
}
