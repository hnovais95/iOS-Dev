//
//  Model.swift
//  Domain
//
//  Created by Heitor Novais | Gerencianet on 11/06/21.
//

import Foundation

public protocol Model: Encodable {}

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
