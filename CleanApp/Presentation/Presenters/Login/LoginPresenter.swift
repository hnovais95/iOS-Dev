//
//  SignUpPresenter.swift
//  Presentation
//
//  Created by Heitor Novais | Gerencianet on 15/06/21.
//

import Foundation
import Domain

public final class LoginPresenter {
    
    private let alertView: AlertView
    private let validation: Validation
    private let authentication: Authentication
    
    public init(alertView: AlertView, authentication: Authentication, validation: Validation) {
        self.alertView = alertView
        self.authentication = authentication
        self.validation = validation
    }
    
    public func login(viewModel: LoginViewModel) {
        if let message = validation.validate(data: viewModel.toJson()) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
        } else {
            authentication.auth(authenticationModel: viewModel.toAuthenticationModel()) { _ in }
        }
    }
}
