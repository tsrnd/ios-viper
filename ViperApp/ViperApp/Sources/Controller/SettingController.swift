//
//  SettingController.swift
//  ViperApp
//
//  Created by MBA on 12/18/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation
import Viper

class SettingController: ActionSettingHandler {
    func showNestedView() {
        RoutingResolver.goto("/home/feeds/0")
    }
}
