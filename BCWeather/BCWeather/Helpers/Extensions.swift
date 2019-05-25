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
extension UIImage {

    func maskWithColor(color: UIColor) -> UIImage? {
        let maskImage = cgImage

        let width = size.width
        let height = size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)

        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!

        guard let maskImg = maskImage else { return nil }
        context.clip(to: bounds, mask: maskImg)
        context.setFillColor(color.cgColor)
        context.fill(bounds)

        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        } else {
            return nil
        }
    }

}

/// App Specific Colors & color helpers
extension UIColor {
    static let BCWAccent = UIColor(red: 237/255.0, green: 28/255.0, blue: 64/255.0, alpha: 1.0)
    static let BCWAccentDark = UIColor.BCWAccent.darker(by: 40)
    static let BCWBlack = UIColor(white: 14.0 / 255.0, alpha: 1.0)
    static let BCWBlack45 = UIColor(white: 14.0 / 255.0, alpha: 0.45)
    static let BCWBlack85 = UIColor(white: 14.0 / 255.0, alpha: 0.85)
    static let BCWDarkGray = UIColor(white: 32.0 / 255.0, alpha: 1.0)
    static let BCWWhite = UIColor(white: 255.0 / 255.0, alpha: 1.0)

    /// function to make color darker than the original color we are applying the function to
    /// - Parameter percentage of how darker we want our resulting color to be.
    /// - Returns the darker color
    func darker(by percentage:CGFloat=30.0) -> UIColor? {
        return adjust(by: -1 * abs(percentage) )
    }

    /// function to make a simple UIImage computed and generated from the parameter received.
    /// - Parameter color UIColor, the color of the resulting UIImage we want to get
    class func imageWithColor(color:UIColor) -> UIImage? {

        let rect:CGRect = CGRect(x:0, y:0, width:1, height:1)
        UIGraphicsBeginImageContext(rect.size)
        guard let context:CGContext = UIGraphicsGetCurrentContext() else { return nil }

        context.setFillColor(color.cgColor)
        context.fill(rect)

        guard let image:UIImage = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()

        return image
    }

    /// function used to alter color
    /// - Parameter percentage change on the initial color
    /// - Returns the color
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

/// Array Helpers
extension Array where Element: Equatable {
    /// function to make the removal of an object in an array easier to deal with
    /// - Parameter obj Element, the object to remove from the Array
    mutating func remove(obj: Element) {
        self = self.filter { $0 != obj }
    }
}

/// UIImage Helpers
extension UIImage {
    /// function to resize a simple UIImage to a specific size.
    /// - Parameter newSize CGSize, the new image size
    /// - Returns the resize image
    func scaleImage(toSize newSize: CGSize) -> UIImage? {
        var newImage: UIImage?
        let newRect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height).integral
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        if let context = UIGraphicsGetCurrentContext(), let cgImage = self.cgImage {
            context.interpolationQuality = .high
            let flipVertical = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: newSize.height)
            context.concatenate(flipVertical)
            context.draw(cgImage, in: newRect)
            if let img = context.makeImage() {
                newImage = UIImage(cgImage: img)
            }
            UIGraphicsEndImageContext()
        }
        return newImage
    }
}

