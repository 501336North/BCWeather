//
//  ServiceFactory.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-24.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import Foundation

enum ServiceFactory {
    static func resolve<Service>(serviceType: Service.Type) -> Service? {
        return Bootstrapper.getContainer().resolve(serviceType)
    }
}
