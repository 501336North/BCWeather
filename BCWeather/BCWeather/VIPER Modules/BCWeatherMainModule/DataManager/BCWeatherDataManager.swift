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
    func retrieveWeather(for city: String) {
        APIClient.retrieveWeather(for: city, completion: {openWeather -> Void in
            self.remoteRequestHandler?.onOpenWeatherRetrieved(openWeather)
        })
    }

}
