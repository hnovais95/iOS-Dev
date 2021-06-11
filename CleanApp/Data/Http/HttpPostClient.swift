//
//  HttpPostClient.swift
//  Data
//
//  Created by Heitor Novais | Gerencianet on 11/06/21.
//

import Foundation

public protocol HttpPostClient {
    
    func post(to url: URL, with data: Data?, completion: @escaping (Result<Data, HttpError>) -> Void)
}
