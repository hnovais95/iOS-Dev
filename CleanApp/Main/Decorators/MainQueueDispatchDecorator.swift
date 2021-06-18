//
//  MainQueueDispatchDecorator.swift
//  Main
//
//  Created by Heitor Novais | Gerencianet on 17/06/21.
//

import Foundation
import Domain

public final class MainQueueDispatchDecortator<T> {
    
    private let instance: T
    
    public init(_ instance: T) {
        self.instance = instance
    }
    
    func dispatch(completion: @escaping () -> Void) {
        guard Thread.isMainThread else { return DispatchQueue.main.async(execute: completion) }
        completion()
    }
}

extension MainQueueDispatchDecortator: AddAccount where T: AddAccount {
    
    public func add(addAccountModel: AddAccountModel, completion: @escaping (AddAccount.Result) -> Void) {
        instance.add(addAccountModel: addAccountModel) { [weak self] result in
            self?.dispatch { completion(result) }
        }
    }
}
