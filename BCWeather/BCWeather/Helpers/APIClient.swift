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
    private static func performRequest(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Weather)->Void) -> DataRequest {

        return Alamofire.request(route).responseObject() { (response: DataResponse<Weather>) in
            let event = response.result.value
            switch response.result {
            case .success:
                completion(event!)
            case .failure(let error):
                print(error)
            }
        }
    }

    static func retrieveWeather(for city: String, completion:@escaping (Weather)->Void) {
        performRequest(route: APIRouter.retrieveWeather(city: city), completion: completion)
    }

}


