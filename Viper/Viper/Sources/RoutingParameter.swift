//
//  RoutingParameter.swift
//  Viper
//
//  Created by MBA on 10/3/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation

public class RoutingParameter {
    private var _values: [String: AnyObject]
    
    public init(values: [String: AnyObject]) {
        _values = values
    }
    
    public func value<ValueType: AnyObject>(forKey key: String) -> ValueType? {
        return _values[key] as? ValueType
    }
}
