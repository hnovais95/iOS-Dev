//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Heitor Novais | Gerencianet on 06/05/21.
//

import Foundation

class PasswordGenerator {
    static func generate(rules: Rules) -> String? {
        if !isValid(rules) {
            return nil
        }

        let universe = getUniverse(by: rules)
        let mandatoryCharacters = getRandomMandarotyCharacters(by: rules)
        var password = mandatoryCharacters
        
        while password.count < rules.passwordLength {
            guard let randomChar = universe.randomElement() else { return nil }
            password.append(randomChar)
        }
        return String(password.shuffled())
    }
    
    private static func isValid(_ rules: Rules) -> Bool {
        return ((rules.passwordLength > 0) &&
                (rules.useSmallLetters ||
                 rules.useCapitalLetters ||
                 rules.useDigits ||
                 rules.useSpecialCharacters))
    }
    
    private static func getUniverse(by rules: Rules) -> String {
        var universe = String()        
        if rules.useSmallLetters {
            let smallLetters = Characters.getSmallLetters()
            universe.append(String(smallLetters))
        }
        if rules.useCapitalLetters {
            let capitalLetters = Characters.getCapitalLetters()
            universe.append(String(capitalLetters))
        }
        if rules.useDigits {
            let digits = Characters.getDigits()
            universe.append(digits.reduce("", { String($0) + String($1) } ))
        }
        if rules.useSpecialCharacters {
            let specialCharacters = Characters.getSpecialCharacters()
            universe.append(String(specialCharacters))
        }
        return universe
    }
    
    private static func getRandomMandarotyCharacters(by rules: Rules) -> String {
        var characters = String()
        if rules.useSmallLetters {
            let smallLetters = Characters.getSmallLetters()
            if let randomSmallLetter = smallLetters.randomElement() {
                characters.append(randomSmallLetter)
            }
        }
        if rules.useCapitalLetters {
            let capitalLetters = Characters.getCapitalLetters()
            if let randomCapitalLetter = capitalLetters.randomElement() {
                characters.append(randomCapitalLetter)
            }
        }
        if rules.useDigits {
            let digits = Characters.getDigits()
            if let randomDigit = digits.randomElement() {
                characters.append(String(randomDigit))
            }
        }
        if rules.useSpecialCharacters {
            let specialCharacters = Characters.getSpecialCharacters()
            if let randomSpecialLetter = specialCharacters.randomElement() {
                characters.append(randomSpecialLetter)
            }
        }
        return characters
    }
}

