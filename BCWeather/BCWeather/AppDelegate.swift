//
//  AppDelegate.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-24.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        if let appStartService = ServiceFactory.resolve(serviceType: AppStartupServiceProtocol.self) {
            appStartService.start {
                let bcweatherMain = BCWeatherRouteWireFrame.createBCWeatherMainModule()
                if let window = self.window {
                    window.rootViewController = bcweatherMain
                    window.makeKeyAndVisible()
                }
                self.configAppearance()
            }
        }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

    //TODO: This should be moved elsewher
    /// Setup default UINavigation Appearance.
    func configAppearance() {
        UINavigationBar.appearance().tintColor = UIColor.BCWAccentDark
        UINavigationBar.appearance().barTintColor = UIColor.BCWAccent
        UINavigationBar.appearance().clipsToBounds = false
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font : UIFont.BCWFontRegular17, NSAttributedString.Key.foregroundColor : UIColor.BCWAccentDark as Any]
    }

}

