//
//  RoutingResolver.swift
//  Viper
//
//  Created by MBA on 10/3/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation

public class RoutingResolver {
    private let _root: Router
    
    public init(root: Router) {
        _root = root
        let nc = NotificationCenter.default
        nc.addObserver(
            self,
            selector: #selector(receive(notif:)),
            name: Routing.Name.needRouting,
            object: nil)
    }

    @objc private func receive(notif: Notification) {
        guard let path = notif.userInfo?[Routing.Key.path] as? String, !path.isEmpty else {
            fatalError("there's no path for routing")
        }
        let parameter = notif.userInfo?[Routing.Key.parameter] as? RoutingParameter
        resolve(router: _root, path: path, parameter: parameter)
    }
    
    private func resolve(router: Router, path: String, parameter: RoutingParameter?) {
        if let handler = router.handlers[path] {
            let result = handler(path, parameter)
            switch result {
            case .accepted:
                print("accepted")
            case .rejected:
                print("rejected")
            case .redirect(let from, let to, let parameter):
                print("redirect from '\(from)' to '\(to)'")
                resolve(router: _root, path: to, parameter: parameter)
            }
        } else {
            var comps = path.components(separatedBy: "/")
            while comps.first == "" {
                comps.removeFirst()
            }
            while comps.last == "" {
                comps.removeLast()
            }
            var base = comps.removeFirst()
            base = "/\(base)"
            var path = comps.joined(separator: "/")
            path = "/\(path)"
            guard !base.isEmpty else {
                fatalError("bad routing path '\(path)'")
            }
            guard let child = router.children[base] else {
                fatalError("unhandled routing path '\(path)'")
            }
            resolve(router: child, path: path, parameter: parameter)
        }
    }
}
