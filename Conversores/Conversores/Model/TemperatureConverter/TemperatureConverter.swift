//
//  TemperatureConverter.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 02/05/21.
//

import Foundation

protocol TemperatureConverter {
    func calculate(from unit: TemperatureUnit, value: Double) -> Double
}
