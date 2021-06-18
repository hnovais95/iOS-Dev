//
//  CompareFieldValidation.swift
//  Validation
//
//  Created by Heitor Novais | Gerencianet on 18/06/21.
//

import Presentation

public final class CompareFieldsValidation: Validation, Equatable {
    
    private let fieldName: String
    private let fieldNameToCompare: String
    private let fieldLabel: String
    
    public init(fieldName: String, fieldNameToCompare: String, fieldLabel: String) {
        self.fieldName = fieldName
        self.fieldNameToCompare = fieldNameToCompare
        self.fieldLabel = fieldLabel
    }
    
    public func validate(data: [String : Any]?) -> String? {
        guard let fieldValue = data?[fieldName] as? String,
              let fieldValueToCompare = data?[fieldNameToCompare] as? String,
              fieldValue == fieldValueToCompare else {
            return "O campo \(fieldLabel) é inválido."
        }
        return nil
    }
    
    public static func == (lhs: CompareFieldsValidation, rhs: CompareFieldsValidation) -> Bool {
        return (lhs.fieldName == rhs.fieldName)
            && (lhs.fieldNameToCompare == rhs.fieldNameToCompare)
            && (lhs.fieldLabel == rhs.fieldLabel)
    }
}
