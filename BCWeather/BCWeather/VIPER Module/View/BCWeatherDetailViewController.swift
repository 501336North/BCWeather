//
//  BCWeatherDetailViewController.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit

class BCWeatherDetailViewController: UIViewController {
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    @IBOutlet weak var cloudCoveragePctgLabel: UILabel!

    var presenter: BCWeatherDetailPresenterProtocol?
    var openWeather: OpenWeather?

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshOpenWeatherView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

extension BCWeatherDetailViewController:  BCWeatherDetailViewProtocol {
    func refreshOpenWeatherView() {
        title = openWeather?.name
        windSpeedLabel.text = String(format:"%.1f", openWeather?.wind?.speed ?? 0)
        windDirectionLabel.text = "\(openWeather?.wind?.direction ?? 0)°"
        cloudCoveragePctgLabel.text = "\(openWeather?.clouds?.all ?? 0)%"
    }
}