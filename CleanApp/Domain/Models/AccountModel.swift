//
//  AccountModel.swift
//  Domain
//
//  Created by Heitor Novais | Gerencianet on 11/06/21.
//

import Foundation

public struct AccountModel: Model {
    
    public var accessToken: String
    
    public init(accessToken: String) {
        self.accessToken = accessToken
    }
}
