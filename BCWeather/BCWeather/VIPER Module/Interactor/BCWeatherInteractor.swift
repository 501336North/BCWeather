//
//  BCWeatherInteractor.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit


class BCWeatherInteractor: BCWeatherInteractorInputProtocol {
    weak var presenter: BCWeatherInteractorOutputProtocol?
    var remoteDatamanager: BCWeatherRemoteDataManagerInputProtocol?

    /// function to retrieve the list of Open Weather object
    func retrieveWeather(for city: String) {
        remoteDatamanager?.retrieveWeather(for: city)
    }
}

extension BCWeatherInteractor: BCWeatherRemoteDataManagerOutputProtocol {
    /// callback function.  Called when we did retrieve OpenWeather List
    /// - Parameters : Array of OpenWeather Objects
    func onOpenWeatherRetrieved(_ openWeather: [OpenWeather]) {
        presenter?.didRetrieveOpenWeather(openWeather)
    }

    /// callback function.  Called when we get an error while retrieving the OpenWeather List
    func onError() {
        presenter?.onError()
    }

}

