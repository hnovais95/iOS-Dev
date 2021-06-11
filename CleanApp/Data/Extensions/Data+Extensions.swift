//
//  Data+Extensions.swift
//  Data
//
//  Created by Heitor Novais | Gerencianet on 11/06/21.
//

import Foundation

public extension Data {
    
    func toModel<T: Decodable>() -> T? {
        
        return try? JSONDecoder().decode(T.self, from: self)
    }
}
