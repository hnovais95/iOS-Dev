//
//  DataFormatter.swift
//  IMC-Calculator
//
//  Created by Heitor Novais on 30/04/21.
//

import Foundation

class Formatter {
    private let numberFormatter: NumberFormatter
    
    init(identifier: String) {
        self.numberFormatter = NumberFormatter()
        self.numberFormatter.locale = Locale(identifier: identifier)
    }
        
    func toString(from number: NSNumber, decimalPlaces: Int) -> String? {
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = decimalPlaces
        numberFormatter.maximumFractionDigits = decimalPlaces
        return numberFormatter.string(from: number)
    }
    
    func toNumber(from text: String, decimalPlaces: Int) -> NSNumber? {
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = decimalPlaces
        numberFormatter.maximumFractionDigits = decimalPlaces
        return numberFormatter.number(from: text)
    }
}
