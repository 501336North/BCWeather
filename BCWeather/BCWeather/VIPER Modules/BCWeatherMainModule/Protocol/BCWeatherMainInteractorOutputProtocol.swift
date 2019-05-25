//
//  BCWeatherMainInteractorOutputProtocol.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit

protocol BCWeatherMainInteractorOutputProtocol: class {
    /// INTERACTOR -> PRESENTER
    func didRetrieveOpenWeather(_ openWeather: [OpenWeather])
    func onError()
}

