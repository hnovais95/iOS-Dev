//
//  Authentication.swift
//  Domain
//
//  Created by Heitor Novais | Gerencianet on 21/06/21.
//

import Foundation

public protocol Authentication {
    
    typealias Result = Swift.Result<AccountModel, DomainError>
    func auth(authenticationModel: AuthenticationModel, completion: @escaping (Authentication.Result) -> Void)
}

public struct AuthenticationModel: Model {
    
    public var email: String
    public var password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

