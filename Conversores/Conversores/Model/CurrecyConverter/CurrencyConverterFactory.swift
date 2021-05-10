//
//  CurrencyConverterFactory.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 02/05/21.
//

import Foundation

class CurrencyConverterFactory {
    static func createConverter(to unit: Currency) -> CurrencyConverter {
        switch unit {
        case .real:
            return RealConverter()
        case .dollar:
            return DollarConverter()
        }
    }
}
