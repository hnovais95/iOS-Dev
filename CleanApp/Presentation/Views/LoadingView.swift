//
//  LoadingView.swift
//  Presentation
//
//  Created by Heitor Novais | Gerencianet on 16/06/21.
//

public protocol LoadingView {
    
    func display(viewModel: LoadingViewModel)
}

public struct LoadingViewModel: Equatable {
    
    public var isLoading: Bool
    
    public init(isLoading: Bool) {
        self.isLoading = isLoading
    }
}
