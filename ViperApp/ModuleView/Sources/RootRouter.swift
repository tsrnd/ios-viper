//
//  RootRouter.swift
//  ModuleView
//
//  Created by MBA on 10/2/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import SwiftUI
import Viper

public final class RootRouter: Router {
    public struct Path {
        private init() { }
        public static let home = "/home"
    }
    
    public override init(id: String? = nil, root: RootView? = nil) {
        super.init(id: id, root: root)
        let auth = AuthRouter(id: "auth", root: root)
        addChild(auth)
    }
    
    public override var paths: [String] {
        return [
            Path.home
        ]
    }

    override public func resolve(path: String) -> Bool {
        assert(!path.isEmpty, "routing path must not be empty")
        print("resolve path: \(path)")
        let ok = Int.random(in: 0...1) == 0
        guard ok else {
            NotificationCenter.default.post(
            name: Routing.Name.needRouting,
            object: self,
            userInfo: [
                Routing.Key.path: AuthRouter.Path.logIn
            ])
            return true
        }
        switch path {
        case Path.home:
            print("resolved as home")
            return true
        default:
            return super.resolve(path: path)
        }
    }
}
