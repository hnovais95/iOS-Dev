//
//  GameType.swift
//  Loteria
//
//  Created by Heitor Novais | Gerencianet on 04/05/21.
//

enum GameType: Int {
    case megasena, quina
}

extension GameType: CustomStringConvertible {
    var description: String {
        switch self {
        case .megasena:
            return "Mega-Sena"
        case .quina:
            return "Quina"
        }
    }
}

extension GameType {
    private func generateNumbers(range: ClosedRange<Int>, numbers: Int) -> Array<Int> {
        var generatedNumbers = Array<Int>()
        while generatedNumbers.count < numbers {
            generatedNumbers.append(Int.random(in: range))
        }
        return generatedNumbers
    }
    
    func generateGame() -> Array<Int> {
        switch self {
        case .megasena:
            return generateNumbers(range: 1...60, numbers: 6)
        case .quina:
            return generateNumbers(range: 1...80, numbers: 5)
        }
    }    
}
