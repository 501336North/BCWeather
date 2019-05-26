//
//  Wind.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import Foundation
import ObjectMapper

struct Wind: Mappable {

    var speed: Double?
    var direction: Int?

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        speed             <- map["speed"]
        direction         <- map["deg"]
    }
}
