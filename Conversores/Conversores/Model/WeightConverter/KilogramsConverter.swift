//
//  KilogramsConverter.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 02/05/21.
//

import Foundation

class KilogramsConverter: WeightConverter {
    func calculate(from unit: WeightUnit, value: Double) -> Double {
        switch unit {
        case .pounds:
            return value * 2.20462
        case .kilograms:
            return value
        }
    }
}
