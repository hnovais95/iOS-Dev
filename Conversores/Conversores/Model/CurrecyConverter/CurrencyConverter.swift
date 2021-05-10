//
//  CurrencyConverter.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 02/05/21.
//

import Foundation

protocol CurrencyConverter {
    func calculate(from unit: Currency, value: Double) -> Double
}
