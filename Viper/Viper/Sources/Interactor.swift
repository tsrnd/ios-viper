//
//  Interactor.swift
//  Viper
//
//  Created by MBA on 10/1/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation

public protocol Usecase { }
public protocol UsecaseOutput { }

public protocol Interactable: Usecase {
    var output: UsecaseOutput { get set }
    func handle(input: (AnyObject) -> Void)
}
