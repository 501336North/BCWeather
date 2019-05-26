//
//  Extensions.swift
//  BCWeather
//
//  Created by Yanick Lavoie on 2019-05-24.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import UIKit

/// App Specific Fonts
extension UIFont {
    static let BCWFontRegular17 = UIFont.systemFont(ofSize: 17.0, weight: UIFont.Weight.regular)
}

/// App Specific Image helpers
extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = URL(string: urlString) {
            getData(from: url) { [weak self] data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async() {
                    self?.image = UIImage(data: data)
                }
            }
        }
    }

    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

}

/// App Specific Colors & color helpers
extension UIColor {
    static let BCWAccent = UIColor(red: 23/255.0, green: 28/255.0, blue: 234/255.0, alpha: 1.0)
    static let BCWAccentDark = UIColor.BCWAccent.darker(by: 40)
    static let BCWBlack = UIColor(white: 14.0 / 255.0, alpha: 1.0)
    static let BCWBlack45 = UIColor(white: 14.0 / 255.0, alpha: 0.45)
    static let BCWBlack85 = UIColor(white: 14.0 / 255.0, alpha: 0.85)
    static let BCWDarkGray = UIColor(white: 32.0 / 255.0, alpha: 1.0)
    static let BCWWhite = UIColor(white: 255.0 / 255.0, alpha: 1.0)

    /// function to make color darker than the original color we are applying the function to
    /// - parameters:
    ///   - percentage: how darker we want our resulting color to be.
    /// - returns:
    ///   - the darker color
    func darker(by percentage:CGFloat=30.0) -> UIColor? {
        return adjust(by: -1 * abs(percentage) )
    }


    /// function used to alter color
    /// - parameters:
    ///   - percentage: percentage change on the initial color
    /// - returns:
    ///   - the color
    func adjust(by percentage:CGFloat=30.0) -> UIColor? {
        var r:CGFloat=0, g:CGFloat=0, b:CGFloat=0, a:CGFloat=0;
        if(getRed(&r, green: &g, blue: &b, alpha: &a)){
            return UIColor(red: min(r + percentage/100, 1.0),
                           green: min(g + percentage/100, 1.0),
                           blue: min(b + percentage/100, 1.0),
                           alpha: a)
        }else{
            return nil
        }
    }
}

