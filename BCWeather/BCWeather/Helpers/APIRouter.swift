//
//  APIRouter.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-24.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import Alamofire

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
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
            return "/data/2.5/weather?q=" +  city + "&"
        }
    }

    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: APIRouter.baseUrl)!.appendingPathComponent(path))

        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)

        return urlRequest
    }
}

/// function to key Meet API Key in the info.plist file
extension APIRouter {
    static var apiKey: String {
        return Bundle.main.object(forInfoDictionaryKey: "APIKey") as! String
    }
}

