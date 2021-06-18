//
//  ValidationSpy.swift
//  PresentationTests
//
//  Created by Heitor Novais | Gerencianet on 17/06/21.
//

import Presentation

class ValidationSpy: Validation {
    
    var data: [String: Any]?
    var errorMessage: String?
    
    func validate(data: [String : Any]?) -> String? {
        self.data = data
        return errorMessage
    }
    
    func simulateError() {
        self.errorMessage = "Erro"
    }
}
