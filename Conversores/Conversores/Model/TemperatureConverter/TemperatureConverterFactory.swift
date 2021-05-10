//
//  TemperatureConverterFactory.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 02/05/21.
//

import Foundation

class TemperatureConverterFactory {
    static func createConverter(to unit: TemperatureUnit) -> TemperatureConverter {
        switch unit {
        case .celsius:
            return CelsiusConverter()
        case .farenheint:
            return FarenheintConverter()
        }
    }
}
