//
//  CelsiusConveter.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 02/05/21.
//

import Foundation

class CelsiusConverter: TemperatureConverter {
    func calculate(from unit: TemperatureUnit, value: Double) -> Double {
        switch unit {
        case .celsius:
            return value
        case .farenheint:
            return (value - 32) / 1.8
        }
    }
}
