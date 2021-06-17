//
//  SignUpComposer.swift
//  Main
//
//  Created by Heitor Novais | Gerencianet on 17/06/21.
//

import Domain
import UI
import Presentation

public final class SignUpComposer {
    
    public static func composeWith(addAccount: AddAccount) -> SignUpViewController {
        return ControllerFactory.makeSignUp(addAccount: addAccount)
    }
}

class WeakVarProxy<T: AnyObject> {
    
    private weak var instance: T?
    
    init(_ instance: T) {
        self.instance = instance
    }
}

extension WeakVarProxy: AlertView where T: AlertView {
    
    func showMessage(viewModel: AlertViewModel) {
        instance?.showMessage(viewModel: viewModel)
    }
}

extension WeakVarProxy: LoadingView where T: LoadingView {
    
    func display(viewModel: LoadingViewModel) {
        instance?.display(viewModel: viewModel)
    }
}
