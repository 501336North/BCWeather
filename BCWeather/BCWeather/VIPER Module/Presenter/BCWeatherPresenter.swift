//
//  BCWeatherPresenter.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit

class BCWeatherPresenter: BCWeatherPresenterProtocol {
    weak var view: BCWeatherMainViewProtocol?
    var interactor: BCWeatherInteractorInputProtocol?
    var wireFrame: BCWeatherRouteWireFrameProtocol?

    func viewDidLoad() {
        view?.showLoading()
        
        //TODO: ask for perms and translate loc to city to pass as param
        interactor?.retrieveWeather(for: "")
    }

    func retrieveWeather(for city: String) {
        interactor?.retrieveWeather(for: city)
    }

    func navigateToDetails(weather: OpenWeather, from classRef: UIViewController) {
        wireFrame?.navigateToDetails(weather: weather, from: classRef)
    }

    func showSettingsActionSheet(from classRef: UIViewController) {
        let alert = UIAlertController(title: "", message: "Choose Unit", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Metric", style: .default, handler: { (_) in
            UserDefaults.standard.set("metric", forKey: "unit")
            guard let mainViewController = classRef as? BCWeatherMainViewController else { return }
            mainViewController.refreshWeatherData(mainViewController)
        }))
        alert.addAction(UIAlertAction(title: "Imperial", style: .default, handler: { (_) in
            UserDefaults.standard.set("imperial", forKey: "unit")
            guard let mainViewController = classRef as? BCWeatherMainViewController else { return }
            mainViewController.refreshWeatherData(mainViewController)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
        }))

        classRef.present(alert, animated: true, completion: nil)

    }

}

extension BCWeatherPresenter: BCWeatherInteractorOutputProtocol {
    /// callback function.  when we did retrieve Weather data
    /// - Parameters : Array of OpenWeather Objects
    func didRetrieveOpenWeather(_ openWeather: [OpenWeather]) {
        view?.hideLoading()
        view?.showOpenWeatherView(with: openWeather)
    }

    /// callback function.  Called when we get an error while retrieving the Weather data
    func onError() {
        view?.hideLoading()
        view?.showError()
    }

}

class BCWeatherDetailPresenter: BCWeatherDetailPresenterProtocol {
    weak var view: BCWeatherDetailViewProtocol?
}
