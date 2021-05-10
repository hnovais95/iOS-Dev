//
//  StringIsNilOrEmpty.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 07/05/21.
//

extension String {
    static func isNilOrEmpty(_ value: String?) -> Bool {
        guard let string = value, !string.isEmpty else { return true }
        return false
    }
}
