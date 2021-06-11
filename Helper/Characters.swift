//
//  Characters.swift
//  SuperSenha
//
//  Created by Heitor Novais | Gerencianet on 06/05/21.
//

import Foundation

class Characters {
    static func getCharacters(startCode: UInt32, endCode: UInt32) -> [Character]? {
        var characters = [Character]()
        for code in startCode...endCode {
            if let char = Unicode.Scalar(code) {
                characters.append(Character(char))
            }
        }
        return characters
    }

    static func getCharacters(startChar: String, endChar: String) -> [Character]? {
        guard let startChar = Unicode.Scalar(startChar) else { return nil }
        guard let endChar = Unicode.Scalar(endChar) else { return nil }
        
        return getCharacters(startCode: startChar.value, endCode: endChar.value)
    }

    static func getSmallLetters() -> [Character] {
        return getCharacters(startChar: "a", endChar: "z")!
    }

    static func getCapitalLetters() -> [Character] {
        return getCharacters(startChar: "A", endChar: "Z")!
    }

    static func getDigits() -> [Int] {
        let digitsCharacters = getCharacters(startChar: "0", endChar: "9")!
        return Array(digitsCharacters).map({ String($0) }).map({ Int($0)! })
    }

    static func getSpecialCharacters() -> [Character] {
        var specialCharacters = getCharacters(startCode: 32, endCode: 47)!
        specialCharacters.append(contentsOf: getCharacters(startCode: 58, endCode: 64)!)
        specialCharacters.append(contentsOf: getCharacters(startCode: 91, endCode: 96)!)
        specialCharacters.append(contentsOf: getCharacters(startCode: 123, endCode: 126)!)
        return specialCharacters
    }
}
