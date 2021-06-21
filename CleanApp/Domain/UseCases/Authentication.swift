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
    
    public var name: String
    public var password: String
    
    public init(name: String, password: String) {
        self.name = name
        self.password = password
    }
}

