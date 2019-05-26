//
//  BCWeatherProtocol.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//
import UIKit

protocol BCWeatherMainViewProtocol: class {

    var presenter: BCWeatherPresenterProtocol? { get set }

    /// PRESENTER -> VIEW
    func showOpenWeatherView(with openWeather: [OpenWeather])

    func refreshWeather()
    
    func showError()

    func showLoading()

    func hideLoading()
}

protocol BCWeatherRouteWireFrameProtocol: class {
    static func createBCWeatherMainModule() -> UIViewController
    func navigateToDetails(weather: OpenWeather, from classRef: UIViewController) -> Void
}

protocol BCWeatherRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: BCWeatherRemoteDataManagerOutputProtocol? { get set }

    /// INTERACTOR -> REMOTEDATAMANAGER
    func retrieveWeather(for city: String)
}

protocol BCWeatherRemoteDataManagerOutputProtocol: class {
    /// REMOTEDATAMANAGER -> INTERACTOR
    func onOpenWeatherRetrieved(_ openWeather: [OpenWeather])
    func onError()
}

protocol BCWeatherPresenterProtocol: class {
    var view: BCWeatherMainViewProtocol? { get set }
    var interactor: BCWeatherInteractorInputProtocol? { get set }
    var wireFrame: BCWeatherRouteWireFrameProtocol? { get set }

    /// VIEW -> PRESENTER
    func viewDidLoad()
    func navigateToDetails(weather: OpenWeather, from classRef: UIViewController)
    func showSettingsActionSheet(from classRef: UIViewController) -> Void
    func retrieveWeather(for city: String)
}

protocol BCWeatherInteractorInputProtocol: class {
    var presenter: BCWeatherInteractorOutputProtocol? { get set }
    var remoteDatamanager: BCWeatherRemoteDataManagerInputProtocol? { get set }

    /// PRESENTER -> INTERACTOR
    func retrieveWeather(for city: String)
}

protocol BCWeatherInteractorOutputProtocol: class {
    /// INTERACTOR -> PRESENTER
    func didRetrieveOpenWeather(_ openWeather: [OpenWeather])
    func onError()
}

protocol BCWeatherDetailViewProtocol: class {
    var presenter: BCWeatherDetailPresenterProtocol? { get set }

    /// PRESENTER -> VIEW
    func refreshOpenWeatherView()
}

protocol BCWeatherDetailPresenterProtocol: class {
    var view: BCWeatherDetailViewProtocol? { get set }
}




