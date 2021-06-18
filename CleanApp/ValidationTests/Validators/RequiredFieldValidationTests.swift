//
//  RequiredFieldValidationTests.swift
//  ValidationTests
//
//  Created by Heitor Novais | Gerencianet on 18/06/21.
//

import XCTest
import Validation
import Presentation

class RequiredFieldValidationTests: XCTestCase {

    func test_validate_should_return_error_if_field_is_not_provided() {
        let sut = makeSut(fieldName: "email", fieldLabel: "Email")
        let errorMessage = sut.validate(data: ["name": "Heitor"])
        XCTAssertEqual(errorMessage, "O campo Email é obrigatório.")
    }
    
    func test_validate_should_return_error_if_correct_field_label() {
        let sut = makeSut(fieldName: "age", fieldLabel: "Idade")
        let errorMessage = sut.validate(data: ["name": "Heitor"])
        XCTAssertEqual(errorMessage, "O campo Idade é obrigatório.")
    }
    
    func test_validate_should_return_nil_if_field_is_provided() {
        let sut = makeSut(fieldName: "email", fieldLabel: "Email")
        let errorMessage = sut.validate(data: ["email": "any_email@domain.com"])
        XCTAssertNil(errorMessage)
    }
    
    func test_validate_should_return_nil_if_not_data_is_provided() {
        let sut = makeSut(fieldName: "email", fieldLabel: "Email")
        let errorMessage = sut.validate(data: nil)
        XCTAssertEqual(errorMessage, "O campo Email é obrigatório.")
    }
}

extension RequiredFieldValidationTests {
    
    func makeSut(fieldName: String, fieldLabel: String, file: StaticString = #filePath, line: UInt = #line) -> Validation {
        let sut = RequiredFieldValidation(fieldName: fieldName, fieldLabel: fieldLabel)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}
