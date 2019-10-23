//
//  UserInfo.swift
//  ModuleBusiness
//
//  Created by MBA on 10/4/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation

public enum AuthState {
    case authenticated
    case unauthenticated
}

public class UserInfo {
    public var state: AuthState = .unauthenticated
    
    public init() { }
}
