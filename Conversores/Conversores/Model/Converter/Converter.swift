//
//  ConverterFactory.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 02/05/21.
//

import Foundation

class Converter {
    private let measure: Measure
    private let outputUnitRawValue: Int
    
    init(measure: Measure, to outputUnitRawValue: Int) {
        self.measure = measure
        self.outputUnitRawValue = outputUnitRawValue
    }
    
    func toConvert(from unitRawValue: Int, value: Double) -> Double? {
        switch measure {
        case .temperature:
            let converter = TemperatureConverterFactory.createConverter(to: TemperatureUnit(rawValue: outputUnitRawValue)!)
            return converter.calculate(from: TemperatureUnit(rawValue: unitRawValue)!, value: value)
        case .weight:
            let converter = WeightConverterFactory.createConverter(to: WeightUnit(rawValue: outputUnitRawValue)!)
            return converter.calculate(from: WeightUnit(rawValue: unitRawValue)!, value: value)
        case .length:
            let converter = LengthConverterFactory.createConverter(to: LengthUnit(rawValue: outputUnitRawValue)!)
            return converter.calculate(from: LengthUnit(rawValue: unitRawValue)!, value: value)
        case .currency:
            let converter = CurrencyConverterFactory.createConverter(to: Currency(rawValue: outputUnitRawValue)!)
            return converter.calculate(from: Currency(rawValue: unitRawValue)!, value: value)
        }
    }
}
