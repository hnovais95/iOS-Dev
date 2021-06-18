//
//  ValidationTests.swift
//  ValidationTests
//
//  Created by Heitor Novais | Gerencianet on 17/06/21.
//

import XCTest
import Infra

class EmailValidatorAdapterTests: XCTestCase {

    func test_invalid_emails() {
        let sut = makeSut()
        XCTAssertFalse(sut.isValid(email: "rr"))
        XCTAssertFalse(sut.isValid(email: "rr@"))
        XCTAssertFalse(sut.isValid(email: "rr@rr"))
        XCTAssertFalse(sut.isValid(email: "rr@rr."))
        XCTAssertFalse(sut.isValid(email: "rr@."))
        XCTAssertFalse(sut.isValid(email: "@rr.com"))
    }
    
    func test_valid_emails() {
        let sut = makeSut()
        XCTAssertTrue(sut.isValid(email: "any_email@gmail.com"))
        XCTAssertTrue(sut.isValid(email: "any_email@hotmail.com"))
        XCTAssertTrue(sut.isValid(email: "any_email@gmail.com.br"))
    }
}

extension EmailValidatorAdapterTests {
    
    func makeSut() -> EmailValidatorAdapter {
        return EmailValidatorAdapter()
    }
}
