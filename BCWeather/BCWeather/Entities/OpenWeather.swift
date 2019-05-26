//
//  OpenWeather.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import Foundation
import ObjectMapper

struct OpenWeather: Mappable {

    var coord: Coordinates?
    var weather: [Weather]?
    var base: String?
    var main: Main?
    var wind: Wind?
    var clouds: Cloud?
    var rain: Rain?
    var snow: Snow?
    var dt: Double?
    var sys: Sys?
    var visibility: Double?
    var id: Double?
    var name: String?
    var cod: Double?

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        coord             <- map["coord"]
        weather           <- map["weather"]
        base              <- map["base"]
        main              <- map["main"]
        wind              <- map["wind"]
        clouds            <- map["clouds"]
        rain              <- map["rain"]
        snow              <- map["snow"]
        dt                <- map["dt"]
        sys               <- map["sys"]
        visibility        <- map["visibility"]
        id                <- map["id"]
        name              <- map["name"]
        cod               <- map["cod"]
    }
}
