//
//  Cloud.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import Foundation
import ObjectMapper

struct Cloud: Mappable {

    var all: Double?

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        all             <- map["all"]
    }
}
