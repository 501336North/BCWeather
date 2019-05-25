//
//  BCWeatherMainCell.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-25.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit

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
        //TODO: use weather icon
//        weatherIconImageView.image = nil
        //TODO: deal with units
        temperatureLabel.text = String(format:"%.0f°C", openWeather.main?.temp ?? "-")
        cityNameLabel.text = openWeather.name
    }

    override func prepareForReuse() {
        cityScapeBGImageView.image = nil
        weatherIconImageView.image = nil
        temperatureLabel.text = ""
        cityNameLabel.text = ""
    }
}
