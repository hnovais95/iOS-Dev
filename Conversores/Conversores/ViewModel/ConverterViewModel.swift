//
//  ConverterViewModel.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 03/05/21.
//

import Foundation

class ConverterViewModel {
    private(set) var currentMeasure: Measure
    var value: Double?
    var inputUnitRawValue: Int
    var outputUnitRawValue: Int
    
    init() {
        self.currentMeasure = Measure.temperature
        self.value = 0
        self.inputUnitRawValue = 0
        self.outputUnitRawValue = 1
    }
    
    func isValidInput(_ text: String?) -> Bool {
        return !String.isNilOrEmpty(text)
    }
    
    func nextMeasure() {
        currentMeasure.next()
    }
    
    func getUnits() -> (firstUnit: String, secondUnit: String) {
        switch currentMeasure {
        case .temperature:
            return ("Celsius", "Farenheint")
        case .weight:
            return ("Kilograma", "Libra")
        case .length:
            return ("Metro", "Kilômetro")
        case .currency:
            return ("Real", "Dólar")
        }
    }
    
    func getConvertedValue() -> Double? {
        guard let value = value else { return nil }
        let converter = Converter(measure: currentMeasure, to: outputUnitRawValue)
        return converter.toConvert(from: inputUnitRawValue, value: value)
    }
}
