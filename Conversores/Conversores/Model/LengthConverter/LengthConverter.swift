//
//  LengthConverter.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 02/05/21.
//

import Foundation

protocol LengthConverter {
    func calculate(from unit: LengthUnit, value: Double) -> Double
}
