//
//  BCWeatherPresenter.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit

class BCWeatherPresenter: BCWeatherPresenterProtocol {
    weak var view: BCWeatherMainViewProtocol?
    var interactor: BCWeatherInteractorInputProtocol?
    var wireFrame: BCWeatherRouteWireFrameProtocol?

    func viewDidLoad() {
        view?.showLoading()
        
        //TODO: ask for perms and translate loc to city to pass as param
        interactor?.retrieveWeather(for: "")
    }

    func retrieveWeather(for city: String) {
        interactor?.retrieveWeather(for: city)
    }

    func navigateToDetails(weather: OpenWeather, from classRef: UIViewController) {
        wireFrame?.navigateToDetails(weather: weather, from: classRef)
    }

}

extension BCWeatherPresenter: BCWeatherInteractorOutputProtocol {
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

class BCWeatherDetailPresenter: BCWeatherDetailPresenterProtocol {
    weak var view: BCWeatherDetailViewProtocol?
}
