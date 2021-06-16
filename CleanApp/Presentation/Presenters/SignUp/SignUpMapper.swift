//
//  SignUpMapper.swift
//  Presentation
//
//  Created by Heitor Novais | Gerencianet on 16/06/21.
//

import Domain

public final class SignUpMapper {
    
    static func toAccountModel(viewModel: SignUpViewModel) -> AddAccountModel {
        return AddAccountModel(name: viewModel.name!, email: viewModel.email!, password: viewModel.password!, passwordConfirmation: viewModel.passwordConfirmation!)
    }
}
