//
//  Router.swift
//  Viper
//
//  Created by MBA on 10/1/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import SwiftUI
 
public typealias RoutingHandler = (_ path: String, _ parameter: RoutingParameter?) -> RoutingResult
public typealias Guard = (_ path: String, _ parameter: RoutingParameter?) -> Bool

public class Router {
    public let navigator: Navigator?
    
    public init(navigator: Navigator? = nil) {
        self.navigator = navigator
    }

    private var _handlers: [String: RoutingHandler] = [:]
    public var handlers: [String: RoutingHandler] { _handlers }
    
    private var _handlerGuards: [String: Guard] = [:]
    public var handlerGuards: [String: Guard] { _handlerGuards }

    private var _children: [String: Router] = [:]
    public var children: [String: Router] { _children }
    
    private var _childGuards: [String: Guard] = [:]
    public var childGuards: [String: Guard] { _childGuards }

    public func route(path: String, guard: Guard? = nil, handler: @escaping RoutingHandler) {
        _handlerGuards[path] = `guard`
        _handlers[path] = handler
    }

    public func route(base: String, guard: Guard? = nil, router: Router) {
        _childGuards[base] = `guard`
        _children[base] = router
    }
}
