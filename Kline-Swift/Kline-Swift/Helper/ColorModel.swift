//
//  ColorModel.swift
//  Kline-Swift
//
//  Created by Kinyong on 16/7/9.
//  Copyright © 2016年 Ayong. All rights reserved.
//

import UIKit

class ColorModel: NSObject {
    var R: Int!
    var G: Int!
    var B: Int!
    var alpha: CGFloat!
    
    init(r: Int, g: Int, b: Int, alpha: CGFloat) {
        super.init()
        self.R = r
        self.G = g
        self.B = b
        self.alpha = alpha
    }
}
