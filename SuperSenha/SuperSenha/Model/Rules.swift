//
//  Rules.swift
//  SuperSenha
//
//  Created by Heitor Novais | Gerencianet on 06/05/21.
//

import Foundation

struct Rules {
    let passwordLength: Int
    let useDigits: Bool
    let useSmallLetters: Bool
    let useCapitalLetters: Bool
    let useSpecialCharacters: Bool
    
    init(_ passwordLength: Int, _ useSmallLetters: Bool, _ useCapitalLetters: Bool, _ useDigitis: Bool, _ useSpecialCharacters: Bool) {
        self.passwordLength = passwordLength
        self.useSmallLetters = useSmallLetters
        self.useCapitalLetters = useCapitalLetters        
        self.useDigits = useDigitis
        self.useSpecialCharacters = useSpecialCharacters
    }
}
