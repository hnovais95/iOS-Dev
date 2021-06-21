//
//  UITests.swift
//  UITests
//
//  Created by Heitor Novais | Gerencianet on 16/06/21.
//

import XCTest
import UIKit
@testable import UI

class WelcomeViewControllerTests: XCTestCase {
    
    func test_loginButton_calls_login_on_tap() {
        let (sut, buttonSpy) = makeSut()
        sut.loginButton?.simulateTap()
        XCTAssertEqual(buttonSpy.clicks, 1)
    }
}

extension WelcomeViewControllerTests {
    
    func makeSut(file: StaticString = #filePath, line: UInt = #line) -> (WelcomeViewController, ButtonSpy) {
        let buttonSpy = ButtonSpy()
        let sut = WelcomeViewController.instantiate()
        sut.login = buttonSpy.onClick
        sut.loadViewIfNeeded()
        checkMemoryLeak(for: sut, file: file, line: line)
        return (sut, buttonSpy)
    }
    
    class ButtonSpy {
        
        var clicks = 0
        
        func onClick() {
            clicks += 1
        }
    }
}
