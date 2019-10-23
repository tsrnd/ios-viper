//
//  DefaultRoutingResolver.swift
//  ViperApp
//
//  Created by MBA on 10/3/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import SwiftUI
import Viper

extension RoutingResolver {
    static func defaultRoutingResolver(window: UIWindow) -> RoutingResolver {
        let root = rootRouter(navigator: window)
        return RoutingResolver(root: root)
    }
}

private extension RoutingResolver {
    static func rootRouter(navigator: Navigator) -> Router {
        let router = Router(navigator: navigator)
        router.route(path: "/home") { (path, parameter) -> RoutingResult in
            switch UserInfo.default.state {
            case .unauthenticated:
                return .redirect(
                    from: "/home",
                    to: "/auth/login",
                    parameter: nil)
            case .authenticated:
                guard let navigator = router.navigator else {
                    fatalError("navigator of '\(router)' is nil")
                }
                let view = HomeView()
                let host = UIHostingController(rootView: view)
                let navi = UINavigationController(rootViewController: host)
                navigator.rootViewController = navi
                return .accepted
            }
        }
        router.route(base: "/auth", router: authRouter(navigator: navigator))
        return router
    }

    static func authRouter(navigator: Navigator) -> Router {
        let router = Router(navigator: navigator)
        router.route(path: "/login") { (path, parameter) -> RoutingResult in
            guard let navigator = router.navigator else {
                fatalError("navigator of '\(router)' is nil")
            }
            var view = LoginView()
            view.ctrl = DefaultLoginController()
            let host = UIHostingController(rootView: view)
            let navi = UINavigationController(rootViewController: host)
            navigator.rootViewController = navi
            return .accepted
        }
        router.route(path: "/register") { (path, parameter) -> RoutingResult in
            return .accepted
        }
        router.route(path: "/logout") { (path, parameter) -> RoutingResult in
            return .accepted
        }
        return router
    }
}
