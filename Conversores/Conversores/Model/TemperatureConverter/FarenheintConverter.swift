//
//  FarenheintConverter.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 02/05/21.
//

import Foundation

class FarenheintConverter: TemperatureConverter {
    func calculate(from unit: TemperatureUnit, value: Double) -> Double {
        switch unit {
        case .celsius:
            return value * 1.8 + 32
        case .farenheint:
            return value
        }
    }
}
