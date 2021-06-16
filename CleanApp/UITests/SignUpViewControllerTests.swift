//
//  UITests.swift
//  UITests
//
//  Created by Heitor Novais | Gerencianet on 16/06/21.
//

import XCTest
import UIKit
@testable import UI
import Presentation

class SignUpViewControllerTests: XCTestCase {

    func test_loading_is_hidden_on_start() {
        let sb = UIStoryboard(name: "SignUp", bundle: Bundle(for: SignUpViewController.self))
        let sut = sb.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.loadingIndicator.isAnimating, false)
    }
    
    func test_sut_implements_loadingView() {
        let sb = UIStoryboard(name: "SignUp", bundle: Bundle(for: SignUpViewController.self))
        let sut = sb.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        XCTAssertNotNil(sut as LoadingView)
    }
}
