//
//  RequiredFieldValidation.swift
//  Validation
//
//  Created by Heitor Novais | Gerencianet on 18/06/21.
//

import Presentation

public final class RequiredFieldValidation: Validation, Equatable {
    
    private let fieldName: String
    private let fieldLabel: String
    
    public init(fieldName: String, fieldLabel: String) {
        self.fieldName = fieldName
        self.fieldLabel = fieldLabel
    }
    
    public func validate(data: [String : Any]?) -> String? {
        guard let fieldValue = data?[fieldName] as? String, !fieldValue.isEmpty else {
            return "O campo \(fieldLabel) é obrigatório."
        }
        return nil
    }
    
    public static func == (lhs: RequiredFieldValidation, rhs: RequiredFieldValidation) -> Bool {
        return (lhs.fieldName == rhs.fieldName) && (lhs.fieldLabel == rhs.fieldLabel)
    }
}
