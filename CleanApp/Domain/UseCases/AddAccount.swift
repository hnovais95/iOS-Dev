//
//  AddAccount.swift
//  Domain
//
//  Created by Heitor Novais | Gerencianet on 11/06/21.
//

import Foundation

public protocol AddAccount {
    typealias Result = Swift.Result<AccountModel, DomainError>
    func add(addAccountModel: AddAccountModel, completion: @escaping (AddAccount.Result) -> Void)
}

public struct AddAccountModel: Model {
    
    public var name: String
    public var email: String
    public var password: String
    public var passwordConfirmation: String
    
    public init(name: String, email: String, password: String, passwordConfirmation: String) {
        self.name = name
        self.email = email
        self.password = password
        self.passwordConfirmation = passwordConfirmation
    }
}
