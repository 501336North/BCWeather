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
        let currentCity = UserDefaults.standard.string(forKey: "currentCity") ?? ""
        retrieveWeather(for: currentCity)
    }

    func retrieveWeather(for city: String) {
        interactor?.retrieveWeather(for: city)
    }

    func navigateToDetails(weather: OpenWeather, from classRef: UIViewController) {
        wireFrame?.navigateToDetails(weather: weather, from: classRef)
    }

    func triggerDataRefresh(from classRef: UIViewController) {
        guard let mainViewController = classRef as? BCWeatherMainViewController else { return }
        mainViewController.showLoading()
        mainViewController.refreshWeatherData(mainViewController)
    }

    /// Show an action sheet allowing the user to switch between metric and imperial unit
    /// - parameters:
    ///   - classRef: a reference to the viewController on which to show the actionsheet
    func showSettingsActionSheet(from classRef: UIViewController) {
        let alert = UIAlertController(title: "", message: "Choose Unit", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Metric", style: .default, handler: { [weak self] (_) in
            UserDefaults.standard.set("metric", forKey: "unit")
            self?.triggerDataRefresh(from: classRef)
        }))
        alert.addAction(UIAlertAction(title: "Imperial", style: .default, handler: { [weak self] (_) in
            UserDefaults.standard.set("imperial", forKey: "unit")
            self?.triggerDataRefresh(from: classRef)
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
