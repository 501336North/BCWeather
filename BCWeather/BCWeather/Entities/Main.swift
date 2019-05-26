//
//  Main.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import Foundation
import ObjectMapper

struct Main: Mappable {

    var temp: Double?
    var pressure: Double?
    var humidity: Double?
    var minTemp: Double?
    var maxTemp: Double?
    var seaLevel: Double?
    var groundLevel: Double?

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        temp               <- map["temp"]
        pressure           <- map["pressure"]
        humidity           <- map["humidity"]
        minTemp            <- map["temp_min"]
        maxTemp            <- map["temp_max"]
        seaLevel           <- map["sea_level"]
        groundLevel        <- map["grnd_level"]
    }
}
