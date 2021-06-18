//
//  Validation.swift
//  Presentation
//
//  Created by Heitor Novais | Gerencianet on 17/06/21.
//

public protocol Validation {
    
    func validate(data: [String: Any]?) -> String?
}
