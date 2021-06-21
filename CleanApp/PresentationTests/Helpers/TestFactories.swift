//
//  TestFactories.swift
//  PresentationTests
//
//  Created by Heitor Novais | Gerencianet on 16/06/21.
//

import Presentation

func makeSignUpViewModel(name: String? = "any_name", email: String? = "any_email@domain.com", password: String? = "any_password", passwordConfirmation: String? = "any_password") -> SignUpRequest {
    return SignUpRequest(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation)
}

func makeLoginViewModel(email: String? = "any_email@domain.com", password: String? = "any_password") -> LoginRequest {
    return LoginRequest(email: email, password: password)
}
