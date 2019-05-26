//
//  APIRouter.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-24.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import Alamofire

/// MonitoredCities : The requirements asked for London and Tokyo to always be shown
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

            let unit = UserDefaults.standard.string(forKey: "unit") ?? "metric"
            var cityIDs = MonitoredCities.allCases
                .map { "\($0.cityId)" }
                .joined(separator: ",")

            if city != "" {
                if let filePath = Bundle.main.path(forResource: "city.list", ofType: "json"), let data = NSData(contentsOfFile: filePath) {

                    do {
                        let decoder = JSONDecoder()
                        let cities = try decoder.decode([City].self, from: data as Data)
                        let currentCity = cities.filter{ $0.name == city }.first
                        guard let currentCityId = currentCity?.id else { return "/data/2.5/group?id=" +  cityIDs + "&units=" + unit + "&appid=" + APIRouter.apiKey }
                        cityIDs = cityIDs + "," + String(format:"%.0f", currentCityId)
                    }
                    catch {
                    }
                }
            }

            return "/data/2.5/group?id=" +  cityIDs + "&units=" + unit + "&appid=" + APIRouter.apiKey
        }
    }

    func asURLRequest() throws -> URLRequest {
        let urlString = APIRouter.baseUrl + path
        guard let url = URL(string: urlString) else {
            fatalError("Unconstructable URL: \(urlString)")
        }
        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}

/// function to key Meet API Key in the info.plist file
extension APIRouter {
    static var apiKey: String {
        return Bundle.main.object(forInfoDictionaryKey: "openWeatherAPIKey") as? String ?? ""
    }
}

