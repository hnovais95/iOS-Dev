//
//  ApiUrlFactory.swift
//  Main
//
//  Created by Heitor Novais | Gerencianet on 18/06/21.
//

import Foundation

func makeApiUrl(path: String) -> URL {
    return URL(string: "\(Environment.variable(.apiBaseUrl))/\(path)")!
}
