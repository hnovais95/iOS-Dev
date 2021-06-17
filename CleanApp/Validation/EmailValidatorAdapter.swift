//
//  EmailValidatorAdapter.swift
//  Validation
//
//  Created by Heitor Novais | Gerencianet on 17/06/21.
//

import Foundation
import Presentation

public class EmailValidatorAdapter: EmailValidator {
    
    private let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    public init() {}
    
    public func isValid(email: String) -> Bool {
        let range = NSRange(location: 0, length: email.utf16.count)
        let regex = try! NSRegularExpression(pattern: pattern)
        return regex.firstMatch(in: email, range: range) != nil
    }
}
