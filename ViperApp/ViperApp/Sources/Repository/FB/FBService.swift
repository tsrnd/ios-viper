//
//  DTO.swift
//  ViperApp
//
//  Created by MBA on 10/24/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import Foundation
import Alamofire

class FBBody<FBModel>: Codable where FBModel: Codable {
    class FBMeta: Codable {
        var message: String?
        var total: Int?
        var offset: Int?
        var limit: Int?
    }

    var meta: FBMeta?
    var data: FBModel?
}
