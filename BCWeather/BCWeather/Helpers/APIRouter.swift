//
//  APIRouter.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-24.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import Alamofire

enum MonitoredCities : CaseIterable {
    case London
    case Tokyo

    var cityId: String {
        switch self {
        case .London:
            return "2643744"
        case .Tokyo:
            return "1850147"
        }
    }
}

enum APIRouter: URLRequestConvertible {
    static let baseUrl = "https://api.openweathermap.org"

    case retrieveWeather(city: String)

    private var method: HTTPMethod {
        switch self {
        case .retrieveWeather:
            return .get
        }
    }

    private var path: String {
        switch self {
        case .retrieveWeather(let city):

            var cityIDs = MonitoredCities.allCases
                .map { "\($0.cityId)" }
                .joined(separator: ",")

            //TODO: get ID for the current city to pass as the 3rd param
            if city != "" {
                let currentCityID = "111111"
                cityIDs = cityIDs + "," + currentCityID
            }

            //TOO: handle metric or farenheit
            let unit = "metric"
            return "/data/2.5/group?id=" +  cityIDs + "&units=" + unit + "&appid=" + APIRouter.apiKey
        }
    }

    func asURLRequest() throws -> URLRequest {
        let urlString = APIRouter.baseUrl + path
        //TODO: get rid of this forced unwrap
        let url = URL(string: urlString)!
        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}

/// function to key Meet API Key in the info.plist file
extension APIRouter {
    static var apiKey: String {
        return Bundle.main.object(forInfoDictionaryKey: "openWeatherAPIKey") as! String
    }
}

