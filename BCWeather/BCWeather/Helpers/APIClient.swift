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
    @discardableResult
    private static func performRequest(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping ([OpenWeather])->Void) -> DataRequest {

        return Alamofire.request(route).responseObject() { (response: DataResponse<OpenWeatherResponse>) in
            let openWeatherResponse = response.result.value
            switch response.result {
            case .success:
                //TODO: Take care of this forced unwrap
                completion(openWeatherResponse!.list ?? [])
            case .failure(let error):
                print(error)
            }
        }
    }

    static func retrieveWeather(for city: String, completion:@escaping ([OpenWeather])->Void) {
        performRequest(route: APIRouter.retrieveWeather(city: city), completion: completion)
    }

}


