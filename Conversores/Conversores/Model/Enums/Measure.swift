//
//  Measure.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 02/05/21.
//

enum Measure: CaseIterable {
    case temperature
    case weight
    case length
    case currency
}

extension Measure: CustomStringConvertible {
    var description: String {
        switch self {
        case .temperature:
            return "Temperatura"
        case .weight:
            return "Peso"
        case .length:
            return "Comprimento"
        case .currency:
            return "Moeda"
        }
    }
}
