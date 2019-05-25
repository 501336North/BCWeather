//
//  BCWeatherMainPresenterProtocol.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit

protocol BCWeatherMainPresenterProtocol: class {
    var view: BCWeatherMainViewProtocol? { get set }
    var interactor: BCWeatherMainInteractorInputProtocol? { get set }
    var wireFrame: BCWeatherMainWireFrameProtocol? { get set }

    /// VIEW -> PRESENTER
    func viewDidLoad()
}
