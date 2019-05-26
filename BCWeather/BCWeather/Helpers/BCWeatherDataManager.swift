//
//  BCWeatherDataManager.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class BCWeatherDataManager: BCWeatherRemoteDataManagerInputProtocol {
    var remoteRequestHandler: BCWeatherRemoteDataManagerOutputProtocol?

    /// function to retrieve the weather data from the backend
    ///
    /// - parameters:
    ///   - city: the city for which to retrieve the weather.  It represents the
    ///           current location as we already know that we need to pull data for
    ///           London and Tokyo as per the specs.
    func retrieveWeather(for city: String) {
        DispatchQueue.global(qos: .userInitiated).async {
            APIClient.retrieveWeather(for: city, completion: { [weak self] openWeather -> Void in
                self?.remoteRequestHandler?.onOpenWeatherRetrieved(openWeather)
            })
        }
    }

}
