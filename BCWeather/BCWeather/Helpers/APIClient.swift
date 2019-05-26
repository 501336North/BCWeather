//
//  APIClient.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-24.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class APIClient {

    /// Perform an http request
    /// - parameters:
    ///   - route: the route to execute
    ///   - decoder: the JSON decoder
    ///   - completion: closure to be executed on completion
    /// - returns:
    ///   - data request all configured
    @discardableResult
    private static func performRequest(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping ([OpenWeather])->Void) -> DataRequest {

        return Alamofire.request(route).responseObject() { (response: DataResponse<OpenWeatherResponse>) in
            let openWeatherResponse = response.result.value
            switch response.result {
            case .success:
                guard let weatherResponse = openWeatherResponse else { return }
                completion(weatherResponse.list ?? [])
            case .failure(let error):
                print(error)
            }
        }
    }

    /// Retrieve the Weather for a a few cities
    /// - parameters:
    ///   - city: the current location
    ///   - completion: closure to be executed on completion
    static func retrieveWeather(for city: String, completion:@escaping ([OpenWeather])->Void) {
        performRequest(route: APIRouter.retrieveWeather(city: city), completion: completion)
    }

}


