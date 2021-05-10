//
//  RealConveter.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 02/05/21.
//

import Foundation

class RealConverter: CurrencyConverter {
    func calculate(from unit: Currency, value: Double) -> Double {
        switch unit {
        case .real:
            return value
        case .dollar:
            return value * 5.24
        }
    }
}
