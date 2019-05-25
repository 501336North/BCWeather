//
//  Sys.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import Foundation
import ObjectMapper

struct Sys: Mappable {

    var type: String?
    var id: String?
    var message: String?
    var country: String?
    var sunrise: Double?
    var sunset: Double?

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        type           <- map["type"]
        id             <- map["id"]
        message        <- map["message"]
        country        <- map["country"]
        sunrise        <- map["sunrise"]
        sunset         <- map["sunset"]
    }
}
