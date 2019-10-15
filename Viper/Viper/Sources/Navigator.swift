//
//  RootView.swift
//  Viper
//
//  Created by MBA on 10/3/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import UIKit

public protocol Navigator: AnyObject {
    var rootViewController: UIViewController? { set get }
}

extension UIWindow: Navigator { }

extension UINavigationController: Navigator {
    public var rootViewController: UIViewController? {
        set {
            guard let root = newValue else {
                viewControllers = []
                return
            }
            viewControllers = [root]
        }
        get {
            viewControllers.first
        }
    }
}
