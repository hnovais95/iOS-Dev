//
//  CalculatorViewModel.swift
//  IMC
//
//  Created by Heitor Novais | Gerencianet on 10/05/21.
//

final class CalculatorViewModel {
    var weight: Double?
    var height: Double?
    
    func calculateIMC() -> Double? {
        guard let weight = weight else { return nil }
        guard let height = height else { return nil }
        return weight / (height * height)
    }
    
    func getRating(by imc: Double) -> IMCRating {
        switch imc {
        case 0..<16:
            return Magreza()
        case 16..<18.5:
            return AbaixoDoPeso()
        case 18.5..<25:
            return PesoIdeal()
        case 25..<30:
            return Sobrepeso()
        default:
            return Obesidade()
        }
    }
}
