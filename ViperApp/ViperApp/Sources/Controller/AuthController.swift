//
//  AuthController.swift
//  ViperApp
//
//  Created by MBA on 10/14/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation
import Viper

class AuthController: LoginHandler {
    func login() {
        UserInfo.default.state = .authenticated
        RoutingResolver.goto("/feeds")
    }
}
