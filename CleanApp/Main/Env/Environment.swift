//
//  Enviroment.swift
//  Main
//
//  Created by Heitor Novais | Gerencianet on 17/06/21.
//

import Foundation

public final class Environment {
    
    public enum EnvironmentVariables: String {
        case apiBaseUrl = "API_BASE_URL"
    }
    
    public static func variable(_ key: EnvironmentVariables) -> String {
        return Bundle.main.infoDictionary![key.rawValue] as! String
    }
}
