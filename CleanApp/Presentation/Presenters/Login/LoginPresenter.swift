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
    private let loadingView: LoadingView
    private let authentication: Authentication
    
    public init(alertView: AlertView, authentication: Authentication, loadingView: LoadingView, validation: Validation) {
        self.alertView = alertView
        self.authentication = authentication
        self.loadingView = loadingView
        self.validation = validation
    }
    
    public func login(viewModel: LoginViewModel) {
        if let message = validation.validate(data: viewModel.toJson()) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
        } else {
            loadingView.display(viewModel: LoadingViewModel(isLoading: true))
            authentication.auth(authenticationModel: viewModel.toAuthenticationModel())  { [weak self] result in
                guard let self = self else { return }
                self.loadingView.display(viewModel: LoadingViewModel(isLoading: false))
                switch result {
                case .failure(let error):
                    let errorMessage: String!
                    switch error {
                    case .expiredSession:
                        errorMessage = "Email e/ou senha inválido(s)."
                    default:
                        errorMessage = "Algo inesperado aconteceu, tente novamente em alguns instantes."
                    }
                    self.alertView.showMessage(viewModel: AlertViewModel(title: "Erro", message: errorMessage))
                case .success:
                    self.alertView.showMessage(viewModel: AlertViewModel(title: "Sucesso", message: "Login feito com sucesso."))
                }
            }
        }
    }
}
