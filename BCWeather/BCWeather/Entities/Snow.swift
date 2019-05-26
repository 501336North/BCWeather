//
//  Snow.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import Foundation
import ObjectMapper

struct Snow: Mappable {

    var h1: Double?
    var h3: Double?


    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        h1           <- map["1h"]
        h3           <- map["3h"]
    }
}
