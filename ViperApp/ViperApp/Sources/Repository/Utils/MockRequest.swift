//
//  FBMockService.swift
//  ViperApp
//
//  Created by MBA on 10/24/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation
import Alamofire

class MockRequest {
    private let _request: DataRequest
    private var _status: Int?
    private var _headers: [String: String]?
    private var _body: MockBody?
    
    init(_ request: DataRequest) {
        _request = request
    }
    
    func shouldReponse(status: Int, headers: [String: String], body: MockBody) -> Self {
        _status = status
        _headers = headers
        _body = body
        return self
    }
    
    func responseDecodable<T>(of type: T.Type = T.self, queue: DispatchQueue = .main, decoder: DataDecoder = JSONDecoder(), completionHandler: @escaping (DataResponse<T, AFError>) -> Void) throws -> Self where T : Decodable {
        let res = HTTPURLResponse(
            url: _request.convertible.urlRequest!.url!,
            statusCode: _status!,
            httpVersion: nil,
            headerFields: _headers)
        let data = "".data(using: .utf8)!
        let t = try decoder.decode(T.self, from: data)
        completionHandler(
            DataResponse<T, AFError>(
                request: _request.convertible.urlRequest,
                response: res,
                data: data,
                metrics: nil,
                serializationDuration: 0,
                result: .success(t)))
        return self
    }
}

enum MockBody {
    case data(data: Data)
    case file(name: String, ext: String)
    case json(json: [String: Any])
    
    var data: Data {
        switch self {
        case .data(let data):
            return data
        case .file(let name, let ext):
            let path = Bundle.main.path(forResource: name, ofType: ext)!
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
            return data
        case .json(let json):
            return try! JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
        }
    }
}

extension DataRequest {
    func mock() -> MockRequest {
        return MockRequest(self)
    }
}
