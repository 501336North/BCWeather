//
//  City.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import Foundation
import ObjectMapper

struct City: Mappable, Codable {

    var id: Double?
    var name: String?
    var country: String?

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        id           <- map["id"]
        name         <- map["name"]
        country      <- map["country"]
    }
}
