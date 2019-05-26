//
//  AppStartupService.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-24.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit
import Foundation

/// User Default First Launch key
let kFirstLaunchKeyKey = "kFirstLaunchKeyKey"

/// Service protocol definition
protocol AppStartupServiceProtocol {
    /// Function to be called to perform any application-specific logic on application launch
    ///
    /// - Parameter closure: Callback called when service logic has completed
    func start(_ closure: (() -> Void)?)

    /// Read-only property describing if a the application is launching for the first time
    var isFirstLaunch: Bool { get }
}

final class AppStartupService : AppStartupServiceProtocol {
    var isFirstLaunch: Bool {
        return UserDefaults.standard.object(forKey: kFirstLaunchKeyKey) == nil
    }

    func start(_ closure: (() -> Void)?) {
        configAppearance()
        if ProcessInfo.processInfo.environment["DISABLE_ANIMATIONS"] == "1" {
            UIView.setAnimationsEnabled(false)
        }

        UserDefaults.standard.set(kFirstLaunchKeyKey, forKey: kFirstLaunchKeyKey)
        closure?()
    }

    /// Setup default UINavigation Appearance.
    private func configAppearance() {
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        UINavigationBar.appearance().tintColor = UIColor.BCWWhite
        UINavigationBar.appearance().clipsToBounds = false
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font : UIFont.BCWFontRegular17, NSAttributedString.Key.foregroundColor : UIColor.BCWWhite as Any]
    }

}


