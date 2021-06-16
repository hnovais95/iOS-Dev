//
//  LoadingViewSpy.swift
//  PresentationTests
//
//  Created by Heitor Novais | Gerencianet on 16/06/21.
//

import Presentation

class LoadingViewSpy: LoadingView {
    
    var viewModel: LoadingViewModel?
    
    func display(viewModel: LoadingViewModel) {
        self.viewModel = viewModel
    }
}
