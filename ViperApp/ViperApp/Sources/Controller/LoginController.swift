//
//  LoginController.swift
//  ViperApp
//
//  Created by MBA on 10/14/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation
import Viper
import ModuleView
import ModuleBusiness

class DefaultLoginController: LoginController {
    func login() {
        User.default.state = .authenticated
        RoutingResolver.goto("/home")
    }
}
