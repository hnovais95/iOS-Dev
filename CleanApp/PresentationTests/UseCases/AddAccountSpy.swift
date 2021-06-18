//
//  AddAccountSpy.swift
//  PresentationTests
//
//  Created by Heitor Novais | Gerencianet on 16/06/21.
//

import Domain

class AddAccountSpy: AddAccount {
    
    var addAccountModel: AddAccountModel?
    var completion: ((AddAccount.Result) -> Void)?
    
    func add(addAccountModel: AddAccountModel, completion: @escaping (AddAccount.Result) -> Void) {
        self.addAccountModel = addAccountModel
        self.completion = completion
    }
    
    func completeWithError(_ error: DomainError) {
        completion?(.failure(error))
    }
    
    func completeWithAccount(_ account: AccountModel) {
        completion?(.success(account))
    }
}
