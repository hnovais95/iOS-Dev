//
//  File.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 02/05/21.
//

import Foundation

class LengthConverterFactory {
    static func createConverter(to unit: LengthUnit) -> LengthConverter {        
        switch unit {
        case .meter:
            return MeterConverter()
        case .kilometer:
            return KilometerConverter()
        }
    }
}
