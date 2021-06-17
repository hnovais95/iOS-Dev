//
//  SignUpIntegrationTests.swift
//  MainTests
//
//  Created by Heitor Novais | Gerencianet on 17/06/21.
//

import XCTest
import Main

class SignUpIntegrationTests: XCTestCase {

    func test_ui_presentation_integration() {
        let sut = SignUpComposer.composeWith(addAccount: AddAccountSpy())
        checkMemoryLeak(for: sut)
    }
}
