//
//  EmailValidatorSpy.swift
//  PresentationTests
//
//  Created by Heitor Novais | Gerencianet on 16/06/21.
//

import Validation

class EmailValidatorSpy: EmailValidator {
    
    var isValid = true
    var email: String?
    
    func isValid(email: String) -> Bool {
        self.email = email
        return isValid
    }
    
    func simulateInvalidEmail() {
        self.isValid = false
    }
}
