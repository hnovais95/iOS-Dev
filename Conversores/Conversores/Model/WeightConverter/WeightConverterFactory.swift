//
//  WeigthConverter.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 01/05/21.
//

import Foundation

class WeightConverterFactory {
    static func createConverter(to unit: WeightUnit) -> WeightConverter {
        switch unit {
        case .pounds:
            return PoundsConverter()
        case .kilograms:
            return KilogramsConverter()
        }
    }
}
    



