//
//  FBUserRepository.swift
//  ViperApp
//
//  Created by MBA on 10/24/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation
import Alamofire

class FBUserRepository {
    private let session: Session
    
    init(session: Session = Session.default) {
        self.session = session
    }
    
    func login(credential: [String: Any], completion: @escaping (AFResult<FBBody<FBUser>>) -> Void) throws {
        let req = try! URLRequest(url: "/api/auth/login", method: .post)
        let _ = try session.request(req)
            .mock()
            .shouldReponse(status: 200, headers: [:], body: .file(name: "login", ext: "json"))
            .responseDecodable(of: FBBody<FBUser>.self) { res in
            completion(res.result)
        }
    }
}
