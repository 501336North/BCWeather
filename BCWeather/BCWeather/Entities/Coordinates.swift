//
//  Coordinates.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import Foundation
import ObjectMapper

struct Coordinates: Mappable {

    var lon: Double?
    var lat: Double?

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        lon           <- map["lon"]
        lat           <- map["lat"]
    }
}
