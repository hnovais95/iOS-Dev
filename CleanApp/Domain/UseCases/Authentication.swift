//
//  Authentication.swift
//  Domain
//
//  Created by Heitor Novais | Gerencianet on 21/06/21.
//

import Foundation

public protocol Authentication {
    
    typealias Result = Swift.Result<AccountModel, DomainError>
    func add(addAccountModel: AuthenticationModel, completion: @escaping (AddAccount.Result) -> Void)
}

public struct AuthenticationModel: Model {
    
    public var email: String
    public var password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

