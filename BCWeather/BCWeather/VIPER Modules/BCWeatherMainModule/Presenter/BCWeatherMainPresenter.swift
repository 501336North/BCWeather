//
//  BCWeatherMainPresenter.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit

class BCWeatherMainPresenter: BCWeatherMainPresenterProtocol {
    weak var view: BCWeatherMainViewProtocol?
    var interactor: BCWeatherMainInteractorInputProtocol?
    var wireFrame: BCWeatherMainWireFrameProtocol?

    func viewDidLoad() {
        view?.showLoading()
        
        //TODO: ask for perms and translate loc to city to pass as param
        interactor?.retrieveWeather(for: "")
    }
}

extension BCWeatherMainPresenter: BCWeatherMainInteractorOutputProtocol {
    /// callback function.  when we did retrieve Weather data
    /// - Parameters : Array of OpenWeather Objects
    func didRetrieveOpenWeather(_ openWeather: [OpenWeather]) {
        view?.hideLoading()
        view?.showOpenWeatherView(with: openWeather)
    }

    /// callback function.  Called when we get an error while retrieving the Weather data
    func onError() {
        view?.hideLoading()
        view?.showError()
    }

}


