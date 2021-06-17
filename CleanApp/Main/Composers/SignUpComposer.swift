//
//  SignUpComposer.swift
//  Main
//
//  Created by Heitor Novais | Gerencianet on 17/06/21.
//

import Domain
import UI

public final class SignUpComposer {
    
    static func composeWith(addAccount: AddAccount) -> SignUpViewController {
        return ControllerFactory.makeSignUp(addAccount: addAccount)
    }
}
