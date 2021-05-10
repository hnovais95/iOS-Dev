//
//  File2.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 02/05/21.
//

import Foundation

class MeterConverter: LengthConverter {
    func calculate(from unit: LengthUnit, value: Double) -> Double {        
        switch unit {
        case .meter:
            return value
        case .kilometer:
            return value * 1000
        }
    }
}
