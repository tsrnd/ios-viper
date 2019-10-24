//
//  DTO.swift
//  ViperApp
//
//  Created by MBA on 10/24/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation

class Request {
    
}

class Reponse<Model>: Codable where Model: Codable {
    class Meta: Codable {
        var message: String?
        var total: Int?
        var offset: Int?
        var limit: Int?
    }

    var meta: Meta?
    var data: Model?
}
