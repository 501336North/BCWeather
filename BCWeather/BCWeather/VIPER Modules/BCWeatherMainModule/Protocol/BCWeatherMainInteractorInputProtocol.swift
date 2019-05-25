//
//  BCWeatherMainInteractorInputProtocol.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit

protocol BCWeatherMainInteractorInputProtocol: class {
    var presenter: BCWeatherMainInteractorOutputProtocol? { get set }
    var remoteDatamanager: BCWeatherRemoteDataManagerInputProtocol? { get set }

    /// PRESENTER -> INTERACTOR
    func retrieveWeather(for city: String)
}

