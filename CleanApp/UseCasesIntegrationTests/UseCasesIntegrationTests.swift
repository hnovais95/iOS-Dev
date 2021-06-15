//
//  UseCasesIntegrationTests.swift
//  UseCasesIntegrationTests
//
//  Created by Heitor Novais | Gerencianet on 15/06/21.
//

import XCTest
import Data
import Infra
import Domain

class UseCasesIntegrationTests: XCTestCase {

    func test_add_account() {
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "https://clean-node-api.herokuapp.com/api/signup")!
        let sut = RemoteAddAccount(url: url, httpClient: alamofireAdapter)
        let addAccountModel = AddAccountModel(name: "Gorbadock Oldbuck", email: "any_email@domain.com" , password: "secret", passwordConfirmation: "secret")
        let exp = expectation(description: "waiting")
        sut.add(addAccountModel: addAccountModel) { result in
            switch result {
            case .success(let account):
                XCTAssertNotNil(account.id)
                XCTAssertEqual(account.name, addAccountModel.name)
                XCTAssertEqual(account.email, addAccountModel.email)
            case .failure:
                XCTFail("Expect success got \(result) instead")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
}
