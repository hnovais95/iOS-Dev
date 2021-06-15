//
//  UrlProtocolStub.swift
//  InfraTests
//
//  Created by Heitor Novais | Gerencianet on 15/06/21.
//

import Foundation

class UrlProtocolStub: URLProtocol {
    
    static var notify: ((URLRequest) -> Void)?
    static var data: Data?
    static var response: HTTPURLResponse?
    static var error: Error?
    
    static func observeRequest(completion: @escaping (URLRequest) -> Void) {
        UrlProtocolStub.notify = completion
    }
    
    static func simulate(data: Data?, response: HTTPURLResponse?, error: Error?) {
        UrlProtocolStub.data = data
        UrlProtocolStub.response = response
        UrlProtocolStub.error = error
    }
    
    open class override func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    open class override func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    open override func startLoading() {
        UrlProtocolStub.notify?(request)
        
        if let data = UrlProtocolStub.data {
            client?.urlProtocol(self, didLoad: data)
        }
        
        if let response = UrlProtocolStub.response {
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        }
        
        if let error = UrlProtocolStub.error {
            client?.urlProtocol(self, didFailWithError: error)
        }
        
        client?.urlProtocolDidFinishLoading(self)
    }
    
    open override func stopLoading() {}
}
