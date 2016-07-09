//
//  UIColor+helper.swift
//  Kline-Swift
//
//  Created by Kinyong on 16/7/9.
//  Copyright © 2016年 Ayong. All rights reserved.
//

import UIKit

extension UIColor {
    class func colorWithHexString(colorString: String, alpha: CGFloat) -> UIColor {
        guard let rgb = self.RGBWithHexString(colorString, alpha: alpha) else {
            // PS: 因为swift加入了可选机制，流水翻译没有对整个项目进行大概了解。这里就暂时返回一个固定的颜色
            return UIColor.whiteColor()
        }
        let r = CGFloat(rgb.R) * 255.0
        let g = CGFloat(rgb.G) * 255.0
        let b = CGFloat(rgb.B) * 255.0
        
        return UIColor(red:r, green: g, blue: b, alpha: alpha)
    }
    

    
    class func RGBWithHexString(colorString: String, alpha: CGFloat) -> ColorModel? {
        var cString: NSString = colorString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        // String should be 6 or 8 characters
        if cString.length < 6 {
            return nil
        }
        
        // strip 0X if it appears
        if cString.hasPrefix("0X") {
            cString = cString.substringFromIndex(2)
        }
        
        if cString.hasPrefix("#") {
            cString = cString.substringFromIndex(1)
        }
        
        if cString.length != 6 {
            return nil
        }
        
        // Separate into r, g, b substrings
        var range = NSRange()
        range.location = 0
        range.length = 2
        
        // r
        let rString = cString.substringWithRange(range)
        
        // g
        range.location = 2
        let gString = cString.substringWithRange(range)
        
        // b
        range.location = 4
        let bString = cString.substringWithRange(range)
        
        // Scan values
        var r: Int32 = 0
        var g: Int32 = 0
        var b: Int32 = 0
        NSScanner.localizedScannerWithString(rString).scanInt(&r)
        NSScanner.localizedScannerWithString(gString).scanInt(&g)
        NSScanner.localizedScannerWithString(bString).scanInt(&b)

        return ColorModel(r: Int(r), g: Int(g), b: Int(b), alpha: alpha)
    }
}
