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

    var temp: String?
    var pressure: String?
    var humidity: String?
    var minTemp: String?
    var maxTemp: String?
    var seaLevel: String?
    var groundLevel: String?

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
