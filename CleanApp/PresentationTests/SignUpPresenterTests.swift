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

    func test_signUp_should_show_error_message_if_not_privaded() {
        let (sut, alertViewSpy) = makeSut()
        let signUpViewModel = makeInvalidViewModel()
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(alertViewSpy.viewModel, AlertViewModel(title: "Falha na validação", message: "O campo Nome é obrigatório."))
    }
}

extension SignUpPresenterTests {
    
    func makeSut() -> (SignUpPresenter, AlertViewSpy) {
        let alertViewSpy = AlertViewSpy()
        let sut = SignUpPresenter(alertView: alertViewSpy)
        return (sut, alertViewSpy)
    }
    
    func makeValidViewModel() -> SignUpViewModel {
        return SignUpViewModel(name: "Gorbadock Oldbuck", email: "any_email@domain.com" , password: "secret", passwordConfirmation: "secret")
    }
    
    func makeInvalidViewModel() -> SignUpViewModel {
        return SignUpViewModel(email: "any_email@domain.com" , password: "secret", passwordConfirmation: "secret")
    }
    
    class AlertViewSpy: AlertView {
        
        var viewModel: AlertViewModel?
        
        func showMessage(viewModel: AlertViewModel) {
            self.viewModel = viewModel
        }
    }
}
