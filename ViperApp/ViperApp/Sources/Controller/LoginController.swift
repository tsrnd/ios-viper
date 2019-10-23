//
//  LoginController.swift
//  ViperApp
//
//  Created by MBA on 10/14/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation
import Viper

class DefaultLoginController: LoginController {
    func login() {
        UserInfo.default.state = .authenticated
        RoutingResolver.goto("/home")
    }
}
