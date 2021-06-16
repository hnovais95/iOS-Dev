//
//  LoadingViewSpy.swift
//  PresentationTests
//
//  Created by Heitor Novais | Gerencianet on 16/06/21.
//

import Presentation

class LoadingViewSpy: LoadingView {
    
   var notify: ((LoadingViewModel) -> Void)?
    
    func observer(completion: @escaping (LoadingViewModel) -> Void) {
        self.notify = completion
    }
    
    func display(viewModel: LoadingViewModel) {
        self.notify?(viewModel)
    }
}
