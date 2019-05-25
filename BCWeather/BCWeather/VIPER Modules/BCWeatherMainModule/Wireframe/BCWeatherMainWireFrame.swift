//
//  BCWeatherMainWireFrame.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-24.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit

class BCWeatherMainWireFrame: BCWeatherMainWireFrameProtocol {
    /// createEventListModule function.  Called to create the SsmpleEntity List Module.
    /// - Returns : the Event List View Controller
    class func createBCWeatherMainModule() -> UIViewController {
        // test Network
        //TODO: To be removed
        // we would need the city as a param
        _ = APIClient.retrieveWeather(for: "", completion: {_ in })

        let navController = mainStoryboard.instantiateViewController(withIdentifier: "BCWeatherMainView")

        return UIViewController()
    }

    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

}
