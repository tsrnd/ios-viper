//
//  FBMockService.swift
//  ViperApp
//
//  Created by MBA on 10/24/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation

class MockURLProtocol: URLProtocol {
    private var _task: URLSessionTask?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override class func requestIsCacheEquivalent(_ a: URLRequest, to b: URLRequest) -> Bool {
        return false
    }
    
    override func startLoading() {
        _task?.cancel()
    }
    
    override func stopLoading() {
        _task?.cancel()
    }
    
    private var _res: [URLRequest: URLResponse] = [:]
    
    func setResponse(_ res: URLResponse, for req: URLRequest) {
        _res[req] = res
    }
}

extension MockURLProtocol: URLSessionDataDelegate {
    static let `default` = MockURLProtocol()
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        client?.urlProtocol(self, didLoad: data)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        client?.urlProtocolDidFinishLoading(self)
    }
}

extension Session {
    static let mock = Session(
        configuration: URLSessionConfiguration.ephemeral,
        delegate: MockSessionHandler.default)
}
