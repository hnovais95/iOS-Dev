//
//  ValidationComposite.swift
//  Validation
//
//  Created by Heitor Novais | Gerencianet on 18/06/21.
//

import Presentation

final public class ValidationComposite: Validation {
    
    private let validations: [Validation]
    
    public init(validations: [Validation]) {
        self.validations = validations
    }
    
    public func validate(data: [String : Any]?) -> String? {
        for validation in validations {
            if let errorMessage = validation.validate(data: data) {
                return errorMessage
            }
        }
        return nil
    }
}
