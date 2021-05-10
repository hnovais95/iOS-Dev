//
//  File3.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 02/05/21.
//

import Foundation

class KilometerConverter: LengthConverter {
    func calculate(from unit: LengthUnit, value: Double) -> Double {
        switch unit {
        case .meter:
            return value / 1000
        case .kilometer:
            return value
        }
    }
}
