//
//  SignUpPresenter.swift
//  Presentation
//
//  Created by Heitor Novais | Gerencianet on 15/06/21.
//

import Foundation
import Domain

public final class LoginPresenter {
    
    private let validation: Validation
    
    public init(validation: Validation) {
        self.validation = validation
    }
    
    public func login(viewModel: LoginViewModel) {
        _ = validation.validate(data: viewModel.toJson())
    }
}
