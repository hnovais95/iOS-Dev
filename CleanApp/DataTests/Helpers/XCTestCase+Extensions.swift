//
//  XCTestCase+Extensions.swift
//  DataTests
//
//  Created by Heitor Novais | Gerencianet on 14/06/21.
//

import XCTest

extension XCTestCase {    
    
    func checkMemoryLeak(for instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, file: file, line: line)
        }
    }
}
