//
//  DataTests.swift
//  DataTests
//
//  Created by Heitor Novais | Gerencianet on 11/06/21.
//

import XCTest
import Domain
import Data

class RemoteAuthenticationTests: XCTestCase {
    
    func test_add_should_call_httpClient_with_correct_url() {
        let url = makeUrl()
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.auth()
        XCTAssertEqual(httpClientSpy.urls, [url])
    }
}

extension RemoteAuthenticationTests {
    
    func makeSut(url: URL = URL(string: "http://any-url.com")!, file: StaticString = #file, line: UInt = #line) -> (sut: RemoteAuthentication, httpClientSpy: HttpClientSpy) {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAuthentication(url: url, httpClient: httpClientSpy)
        checkMemoryLeak(for: sut, file: file, line: line)
        checkMemoryLeak(for: httpClientSpy, file: file, line: line)
        return (sut, httpClientSpy)
    }
}
