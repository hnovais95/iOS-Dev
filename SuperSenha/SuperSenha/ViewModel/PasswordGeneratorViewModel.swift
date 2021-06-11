//
//  PasswordGeneratorViewModel.swift
//  SuperSenha
//
//  Created by Heitor Novais | Gerencianet on 06/05/21.
//

import Foundation

class PasswordGeneratorViewModel {
    func generatePassword(rules: RulesDTO) -> String? {
        let rules = Rules(rules.passwordLength, rules.useSmallLetters, rules.useCapitalLetters, rules.useDigits, rules.useSpecialCharacters)
        return PasswordGenerator.generate(rules: rules)
    }
}
