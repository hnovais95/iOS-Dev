//
//  PresentationTests.swift
//  PresentationTests
//
//  Created by Heitor Novais | Gerencianet on 15/06/21.
//

import XCTest

class SignUpPresenter {
    
    private let alertView: AlertView
    
    init(alertView: AlertView) {
        self.alertView = alertView
    }
    
    func signUp(viewModel: SignUpViewModel) {
        if (viewModel.name == nil) || viewModel.name!.isEmpty {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: "O campo Nome é obrigatório."))
        }
        
        if (viewModel.email == nil) || viewModel.email!.isEmpty {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: "O campo Email é obrigatório."))
        }
        
        if (viewModel.password == nil) || viewModel.password!.isEmpty {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: "O campo Password é obrigatório."))
        }
        
        if (viewModel.passwordConfirmation == nil) || viewModel.passwordConfirmation!.isEmpty {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: "O campo Passoword Confirmation é obrigatório."))
        }
    }
}

protocol AlertView {
    
    func showMessage(viewModel: AlertViewModel)
}

struct AlertViewModel: Equatable {
    
    var title: String
    var message: String
}

struct SignUpViewModel {
    
    var name: String?
    var email: String?
    var password: String?
    var passwordConfirmation: String?
}

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
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo Password é obrigatório."))
    }
    
    func test_signUp_should_show_error_message_if_passwordConfirmation_not_privaded() {
        let (sut, alertViewSpy) = makeSut()
        let signUpViewModel = makeViewModelWithoutPasswordConfirmation()
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo Passoword Confirmation é obrigatório."))
    }
}

extension SignUpPresenterTests {
    
    func makeSut() -> (SignUpPresenter, AlertViewSpy) {
        let alertViewSpy = AlertViewSpy()
        let sut = SignUpPresenter(alertView: alertViewSpy)
        return (sut, alertViewSpy)
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
    
    class AlertViewSpy: AlertView {
        
        var viewModel: AlertViewModel?
        
        func showMessage(viewModel: AlertViewModel) {
            self.viewModel = viewModel
        }
    }
}
