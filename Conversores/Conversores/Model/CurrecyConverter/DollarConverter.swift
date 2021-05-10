//
//  DollarConverter.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 02/05/21.
//

import Foundation

class DollarConverter: CurrencyConverter {
    func calculate(from unit: Currency, value: Double) -> Double {
        switch unit {
        case .real:
            return value / 5.24
        case .dollar:
            return value
        }
    }
}
