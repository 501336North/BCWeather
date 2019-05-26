//
//  Bootstrapper.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-24.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import Foundation
import Swinject

struct Bootstrapper {
    static let sharedInstance = Bootstrapper()
    private(set) var container: Container

    init() {
        container = Container()
        container.register(AppStartupServiceProtocol.self) { r in
            AppStartupService()
            } .inObjectScope(.container)
    }

    /// getContainer
    ///
    /// - returns:
    ///   - container: a shared instance of the container.
    static func getContainer() -> Container {
        return Bootstrapper.sharedInstance.container
    }
}

