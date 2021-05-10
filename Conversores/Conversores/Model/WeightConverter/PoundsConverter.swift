//
//  PoundsConveter.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 02/05/21.
//

import Foundation

class PoundsConverter: WeightConverter {
    func calculate(from unit: WeightUnit, value: Double) -> Double {
        switch unit {
        case .pounds:
            return value
        case .kilograms:
            return value / 2.20462
        }
    }
}
