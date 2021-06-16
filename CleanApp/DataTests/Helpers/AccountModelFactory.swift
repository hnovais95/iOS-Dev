//
//  AccountModelFactory.swift
//  DataTests
//
//  Created by Heitor Novais | Gerencianet on 14/06/21.
//

import Domain

func makeAccountModel() -> AccountModel {
    return AccountModel(id: "any_id", name: "any_name", email: "any_email@domain.com", password: "any_password")
}

func makeAddAccountModel() -> AddAccountModel {
    return AddAccountModel(name: "any_name", email: "any_email@domain.com", password: "any_password", passwordConfirmation: "any_password")
}
