//
//  Weather.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-24.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import Foundation
import ObjectMapper

struct Weather: Mappable {

    var id: Double?
    var main: String?
    var desc: String?
    var icon: String?

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        id             <- map["id"]
        main           <- map["main"]
        desc           <- map["description"]
        icon           <- map["icon"]
    }
}
