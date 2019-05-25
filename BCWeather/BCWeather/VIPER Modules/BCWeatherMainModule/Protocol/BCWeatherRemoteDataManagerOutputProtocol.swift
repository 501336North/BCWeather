//
//  BCWeatherRemoteDataManagerOutputProtocol.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit

protocol BCWeatherRemoteDataManagerOutputProtocol: class {
    /// REMOTEDATAMANAGER -> INTERACTOR
    func onOpenWeatherRetrieved(_ openWeather: [OpenWeather])
    func onError()
}

