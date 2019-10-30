//
//  FeedController.swift
//  ViperApp
//
//  Created by MBA on 12/18/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation
import Viper

class FeedController: FeedListHandler {
    func showDetail(ofFeed: Any) {
        RoutingResolver.goto("/feeds/0")
    }
}
