//
//  TestFactories.swift
//  DataTests
//
//  Created by Heitor Novais | Gerencianet on 14/06/21.
//

import Foundation

func makeValidData() -> Data {
    return Data("{\"name\":\"Heitor\"}".utf8)
}

func makeInvalidData() -> Data {
    return Data("invalid_data".utf8)
}

func makeUrl() -> URL {
    return URL(string: "http://any-url.com")!
}

func makeError() -> Error {
    return NSError(domain: "any_error", code: 0)
}
