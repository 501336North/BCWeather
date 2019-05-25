//
//  BCWeatherRemoteDataManagerInputProtocol.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit

protocol BCWeatherRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: BCWeatherRemoteDataManagerOutputProtocol? { get set }

    /// INTERACTOR -> REMOTEDATAMANAGER
    func retrieveWeather(for city: String)
}

