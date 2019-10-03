//
//  Router.swift
//  Viper
//
//  Created by MBA on 10/1/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import SwiftUI

public enum RoutingState {
    case none
    case willStart
    case didEnd
}

public protocol RootView {
    var root: UIViewController? { set get }
}

extension UIWindow: RootView {
    public var root: UIViewController? {
        set {
            rootViewController = newValue
        }
        get {
            rootViewController
        }
    }
}

extension UINavigationController: RootView {
    public var root: UIViewController? {
        set {
            guard let root = newValue else {
                viewControllers = []
                return
            }
            viewControllers = [root]
        }
        get {
            viewControllers.first
        }
    }
}

open class Router {
    private var _id: String?
    public var id: String? { _id }

    private var _root: RootView?
    public var root: RootView? { _root }

    open var paths: [String] { fatalError("there're no paths are defined") }

    public var allPaths: [String] {
        var paths = self.paths
        paths.append(contentsOf: _children.flatMap { $0.paths } )
        return paths
    }

    public init(id: String? = nil, root: RootView? = nil) {
        _id = id
        _root = root
    }

    private var _children: [Router] = []
    public var children: [Router] { _children }

    public func addChild(_ child: Router) {
        let itrs = Set(allPaths).intersection(child.paths)
        guard itrs.isEmpty else {
            fatalError("conflicted paths: \(itrs)")
        }
        _children.append(child)
    }

    public func removeChild(_ child: Router) {
        guard let idx = _children.firstIndex(of: child) else {
            fatalError()
        }
        _children.remove(at: idx)
    }

    open func resolve(path: String) -> Bool {
        for router in _children {
            if router.resolve(path: path) {
                return true
            }
        }
        return false
    }
}

extension Router: Equatable {
    public static func == (lhs: Router, rhs: Router) -> Bool {
        guard let lid = lhs.id, let rid = rhs.id, lid == rid else {
            return false
        }
        return true
    }
}

public class Routing {
    public struct Name {
        private init() { }
        public static let needRouting = NSNotification.Name("Viper.Routing.needRouting")
    }

    public struct Key {
        private init() { }
        public static let path = "Viper.Routing.Key.path"
    }

    public static let `default` = Routing()

    public var router: Router?

    private var _state = RoutingState.none
    public var state: RoutingState { _state }

    private var _path: String?
    public var path: String? { _path }

    public init() {
        let nc = NotificationCenter.default
        nc.addObserver(
            self,
            selector: #selector(receive(notif:)),
            name: Routing.Name.needRouting,
            object: nil)
    }

    @objc private func receive(notif: Notification) {
        guard let path = notif.userInfo?[Key.path] as? String, !path.isEmpty else {
            fatalError("there's no path for routing")
        }
        guard let router = router else {
            fatalError("there's no router for routing")
        }
        guard router.resolve(path: path) else {
            fatalError("unhandled routing path: \(path)")
        }
    }
}
