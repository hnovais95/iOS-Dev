//
//  EmailValidator.swift
//  Presentation
//
//  Created by Heitor Novais | Gerencianet on 15/06/21.
//

public protocol EmailValidator {
    
    func isValid(email: String) -> Bool
}
