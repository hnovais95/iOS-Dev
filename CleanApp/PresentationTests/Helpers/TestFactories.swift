//
//  TestFactories.swift
//  PresentationTests
//
//  Created by Heitor Novais | Gerencianet on 16/06/21.
//

import Presentation

func makeSignUpViewModel(name: String? = "any_name", email: String? = "any_email@domain.com", password: String? = "any_password", passwordConfirmation: String? = "any_password") -> SignUpViewModel {
    return SignUpViewModel(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation)
}
