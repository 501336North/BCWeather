//
//  BCWeatherRouteWireFrame.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-24.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit

class BCWeatherRouteWireFrame: BCWeatherRouteWireFrameProtocol {

    /// createBCWeatherMainModule function.  Called to create the OpenWeather List Module.
    /// - Returns : the OpenWeather List View Controller
    class func createBCWeatherMainModule() -> UIViewController {

        let navController = mainStoryboard.instantiateViewController(withIdentifier: "BCWeatherMainView")
        if let view = navController.children.first as? BCWeatherMainViewController {
            let presenter: BCWeatherPresenterProtocol & BCWeatherInteractorOutputProtocol = BCWeatherPresenter()
            let interactor: BCWeatherInteractorInputProtocol & BCWeatherRemoteDataManagerOutputProtocol = BCWeatherInteractor()
            let remoteDataManager: BCWeatherRemoteDataManagerInputProtocol = BCWeatherDataManager()
            let wireFrame: BCWeatherRouteWireFrameProtocol = BCWeatherRouteWireFrame()

            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor

            return navController
        }
        return UIViewController()
    }

    func navigateToDetails(weather: OpenWeather, from classRef: UIViewController) {
        guard let bcWeatherDetailViewController = BCWeatherRouteWireFrame.mainStoryboard.instantiateViewController(withIdentifier: "BCWeatherDetailView") as? BCWeatherDetailViewController else { return }
        bcWeatherDetailViewController.openWeather = weather
        guard let sourceNavigationController = classRef.navigationController else {
            classRef.present(bcWeatherDetailViewController, animated: true, completion: nil)
            return
        }
        sourceNavigationController.pushViewController(bcWeatherDetailViewController, animated: true)
    }

    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

}
