//
//  BCWeatherMainViewProtocol.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit

protocol BCWeatherMainViewProtocol: class {
    var presenter: BCWeatherMainPresenterProtocol? { get set }

    /// PRESENTER -> VIEW
    func showOpenWeatherView(with openWeather: [OpenWeather])

    func showError()

    func showLoading()

    func hideLoading()
}

