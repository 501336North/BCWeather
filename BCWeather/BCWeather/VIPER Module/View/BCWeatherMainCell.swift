//
//  BCWeatherMainCell.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit
import AlamofireImage

class BCWeatherMainCell: UITableViewCell {

    @IBOutlet weak var cityScapeBGImageView: UIImageView!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(openWeather: OpenWeather) {
        //TODO: find a service to return cityscapes
//        cityScapeBGImageView.image = nil

        //TODO: deal with units
        temperatureLabel.text = String(format:"%.0f°C", openWeather.main?.temp ?? "-")
        cityNameLabel.text = openWeather.name

        guard let ico = openWeather.weather?.first?.icon else { return }
        let urlString = "https://openweathermap.org/img/w/" + ico + ".png"
        self.weatherIconImageView.imageFromUrl(urlString: urlString)
    }

    override func prepareForReuse() {
        cityScapeBGImageView.image = nil
        weatherIconImageView.image = nil
        temperatureLabel.text = ""
        cityNameLabel.text = ""
    }
}
