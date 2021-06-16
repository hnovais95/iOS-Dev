//
//  AlertViewSpy.swift
//  PresentationTests
//
//  Created by Heitor Novais | Gerencianet on 15/06/21.
//

import Presentation

class AlertViewSpy: AlertView {
    
    var notify: ((AlertViewModel) -> Void)?
    
    func observer(completion: @escaping (AlertViewModel) -> Void) {
        self.notify = completion
    }
    
    func showMessage(viewModel: AlertViewModel) {
        self.notify?(viewModel)
    }
}
