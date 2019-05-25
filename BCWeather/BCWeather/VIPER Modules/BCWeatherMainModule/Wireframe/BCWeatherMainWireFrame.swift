//
//  BCWeatherMainWireFrame.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-24.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit

class BCWeatherMainWireFrame: BCWeatherMainWireFrameProtocol {
    /// createBCWeatherMainModule function.  Called to create the OpenWeather List Module.
    /// - Returns : the OpenWeather List View Controller
    class func createBCWeatherMainModule() -> UIViewController {

        let navController = mainStoryboard.instantiateViewController(withIdentifier: "BCWeatherMainView")
        if let view = navController.children.first as? BCWeatherMainViewController {
            let presenter: BCWeatherMainPresenterProtocol & BCWeatherMainInteractorOutputProtocol = BCWeatherMainPresenter()
            let interactor: BCWeatherMainInteractorInputProtocol & BCWeatherRemoteDataManagerOutputProtocol = BCWeatherMainInteractor()
            let remoteDataManager: BCWeatherRemoteDataManagerInputProtocol = BCWeatherDataManager()
            let wireFrame: BCWeatherMainWireFrameProtocol = BCWeatherMainWireFrame()

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

    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

}
