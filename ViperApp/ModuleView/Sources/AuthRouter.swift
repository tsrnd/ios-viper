//
//  AuthRouter.swift
//  ModuleView
//
//  Created by MBA on 10/3/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation
import Viper

public final class AuthRouter: Router {
    public struct Path {
        private init() { }
        static let logIn = "/auth/login"
        static let logOut = "/auth/logout"
        static let register = "/auth/register"
    }
    
    public override var paths: [String] {
        return [
            Path.logIn,
            Path.logOut,
            Path.register
        ]
    }

    override public func resolve(path: String) -> Bool {
        assert(!path.isEmpty, "routing path must not be empty")
        print("resolve path: \(path)")
        switch path {
        case Path.logIn:
            print("resolved as login")
            return true
        case Path.logOut:
            print("resolved as logout")
            return true
        case Path.register:
            print("resolved as register")
            return true
        default:
            return super.resolve(path: path)
        }
    }
}
