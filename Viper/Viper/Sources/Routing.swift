//
//  Routing.swift
//  Viper
//
//  Created by MBA on 10/3/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation

public enum RoutingResult {
    case accepted
    case rejected
    case redirect(from: String, to: String, parameter: RoutingParameter?)
}

public class Routing {
    public struct Name {
        private init() { }
        public static let needRouting = NSNotification.Name("Viper.Routing.needRouting")
    }

    public struct Key {
        private init() { }
        public static let path = "Viper.Routing.Key.path"
        public static let parameter = "Viper.Routing.Key.parameter"
    }
}
