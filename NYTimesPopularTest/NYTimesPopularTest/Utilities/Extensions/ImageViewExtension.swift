//
//  ImageViewExtension.swift
//  RestaurantsApp
//
//  Created by Adil Anwer on 5/18/18.
//  Copyright © 2018 Adil Anwer. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func round(radius: CGFloat? = nil, borderWidth: CGFloat? = nil , borderColor: UIColor? = nil) {
        
        var cornor : CGFloat
        if let radius = radius {
            cornor = radius
        } else {
            cornor = frame.height / 2
        }
        layer.borderWidth = 2
        layer.masksToBounds = true
        layer.borderColor = UIColor.white.cgColor
        backgroundColor = UIColor.orange
        layer.cornerRadius = cornor
        clipsToBounds = true
    }
}

extension UIImage{
    
    func maskWithColor(color: UIColor) -> UIImage? {
        let maskImage = cgImage!
        
        let width = size.width
        let height = size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
        
        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)
        
        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        } else {
            return nil
        }
    }
    
    class func getColoredRectImageWith(color: CGColor, andSize size: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let graphicsContext = UIGraphicsGetCurrentContext()
        graphicsContext?.setFillColor(color)
        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        graphicsContext?.fill(rectangle)
        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rectangleImage!
    }
}
