//
//  Converter.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 01/05/21.
//

import Foundation

protocol WeightConverter {
    func calculate(from unit: WeightUnit, value: Double) -> Double
}
