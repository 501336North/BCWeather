//
//  OpenWeatherResponse.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import Foundation
import ObjectMapper

struct OpenWeatherResponse: Mappable {

    var list: [OpenWeather]?
    var count: Double?

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        list            <- map["list"]
        count           <- map["count"]
    }
}
