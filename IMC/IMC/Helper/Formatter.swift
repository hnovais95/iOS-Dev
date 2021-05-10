//
//  Formatter.swift
//  IMC
//
//  Created by Heitor Novais | Gerencianet on 10/05/21.
//

import Foundation

class Formatter {
    private let numberFormatter: NumberFormatter
    
    init(identifier: String) {
        self.numberFormatter = NumberFormatter()
        self.numberFormatter.locale = Locale(identifier: identifier)
    }
        
    func toString(value: Double, decimalPlaces: Int) -> String? {
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = decimalPlaces
        numberFormatter.maximumFractionDigits = decimalPlaces
        return numberFormatter.string(from: NSNumber(value: value))
    }
    
    func toDouble(_ text: String) -> Double? {
        numberFormatter.numberStyle = .decimal
        let number = numberFormatter.number(from: text)
        return number?.doubleValue
    }
}
