//
//  LocationManager.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import Foundation
import CoreLocation


class LocationManager: NSObject {

    private let locationManager = CLLocationManager()
    weak var delegate:BCWeatherMainViewProtocol?

    public var exposedLocation: CLLocation? {
        return locationManager.location
    }

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
}


// MARK: - Core Location Delegate
extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {

        switch status {
        case .notDetermined         :
            print("notDetermined")
        case .authorizedWhenInUse   :
            delegate?.refreshWeather()
        case .authorizedAlways      :
            delegate?.refreshWeather()
        case .restricted            :
            print("restricted")
        case .denied                :
            print("denied")
        @unknown default:
            print("denied")
        }
    }
}

// MARK: - Get Placemark
extension LocationManager {

    /// Retrieve Place marks around a geoloc point
    /// - parameters:
    ///   - location: geoloc point
    ///   - completion: closure to be executed on completion
    func getPlace(for location: CLLocation,
                  completion: @escaping (CLPlacemark?) -> Void) {

        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in

            guard error == nil else {
                completion(nil)
                return
            }

            guard let placemark = placemarks?[0] else {
                completion(nil)
                return
            }

            completion(placemark)
        }
    }
}
