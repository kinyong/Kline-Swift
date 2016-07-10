//
//  LineView.swift
//  Kline-Swift
//
//  Created by Kinyong on 16/7/9.
//  Copyright © 2016年 Ayong. All rights reserved.
//

import UIKit

class Lines: UIView {
    var startPoint: CGPoint!  /// 线条起点
    var endPoint: CGPoint!    /// 线条终点
    var points: NSArray?      /// 多点连线数组
    var color: String!        /// 线条颜色
    var lineWidth: CGFloat!   /// 线条宽度
    var isK = false           /// 是否是实体K线，默认是连接线
    var isVol = false         /// 是否是化成交量的实体
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 清除背景颜色
        self.backgroundColor = UIColor.clearColor()
        
        // Initialization code
        initSubView()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext() // 获取绘图上下文
        
        if isK {
            // 画k线
            for item in points! {
                // 转换坐标
                let heightPoint = CGPointFromString((item as! NSArray).objectAtIndex(0) as! String)
                let lowPoint = CGPointFromString((item as! NSArray).objectAtIndex(1) as! String)
                let openPoint = CGPointFromString((item as! NSArray).objectAtIndex(2) as! String)
                let closePoint = CGPointFromString((item as! NSArray).objectAtIndex(3) as! String)
                
                drawkWithContext(context, height: heightPoint, width: lineWidth, low: lowPoint, open: openPoint, close: closePoint)
            }
        } else {
            // 画连线
            drawLineWithContext(context)
        }
        
    }
    
    // MARK: -内部方法
    private func initSubView(){
        startPoint = self.frame.origin
        endPoint = self.frame.origin
        color = "#000000"
        lineWidth = 1.0
    }
    
    // 画连接线
    private func drawLineWithContext(context: CGContextRef?) {
        CGContextSetLineWidth(context, lineWidth)
        CGContextSetShouldAntialias(context, true)
        
        if let colorModel = UIColor.RGBWithHexString(color, alpha: self.alpha) {  // 设置颜色
            CGContextSetRGBStrokeColor(context, CGFloat(colorModel.R) / 255.0, CGFloat(colorModel.G) / 255.0, CGFloat(colorModel.B) / 255.0, self.alpha)
        }
        
        if startPoint.x == endPoint.x && endPoint.y == startPoint.y {
            // 定义多个个点 画多点连线
            for item in points! {
                let currentPoint = CGPointFromString(item as! String)
                
                if currentPoint.y < self.frame.size.height && currentPoint.y > 0 {
                    
                    if points?.indexOfObject(item) == 0 {
                        CGContextMoveToPoint(context, currentPoint.x, currentPoint.y)
                        continue
                    }
                    
                    CGContextAddLineToPoint(context, currentPoint.x, currentPoint.y)
                    CGContextStrokePath(context) //开始划线
                    
                    if points?.indexOfObject(item) < points?.count {
                        CGContextMoveToPoint(context, currentPoint.x, currentPoint.y)
                    }
                }
            }
        } else {
            // 定义两个点，画两点连线
            let point1 = startPoint
            let point2 = endPoint
            
            CGContextStrokeLineSegments(context, [point1, point2], 2) // 默认不会回执端点
        }
    }
    
    // 画一根线
    func drawkWithContext(context: CGContextRef?, height: CGPoint,width: CGFloat, low: CGPoint, open: CGPoint, close: CGPoint) {
        CGContextSetShouldAntialias(context, false)
        // 首先判断是绿的还是红的，根据开盘价和收盘价的坐标来计算
        var isKong = false
        var colorModel = UIColor.RGBWithHexString("FF0000", alpha: self.alpha) // 设置默认红色
        
        // 如果开盘价坐标在收盘价坐标商法，则为绿色，即空
        if open.y < close.y {
            isKong = true
            colorModel = UIColor.RGBWithHexString("00FFFF", alpha: self.alpha) // 设置为绿色
        }
        // 设置颜色
        CGContextSetRGBStrokeColor(context, CGFloat(colorModel!.R) / 255.0, CGFloat(colorModel!.G) / 255.0, CGFloat(colorModel!.B) / 255.0, self.alpha)
        
        // 首先画一个垂直的线包含上影线和下影线
        // 定义两个点，画两点连线
        if !isVol {
            CGContextSetLineWidth(context, 1) // 上下影线的宽度
            if lineWidth <= 2 {
                CGContextSetLineWidth(context, 0.5) // 上下影线的宽度
            }
            
            let point1 = height
            let point2 = low
            CGContextStrokeLineSegments(context, [point1, point2], 2) // 绘制线段（默认不绘制端点）
        }
        
        // 再画中间的实体
        CGContextSetLineWidth(context, width) // 改变线的宽度
        let halfWidth: CGFloat = 0 // windth / 2
        // 纠正实体的中心点为当前坐标
        var openPoint = CGPointMake(open.x - halfWidth, open.y)
        var closePoint = CGPointMake(close.x - halfWidth, close.y)
        
        if isVol {
            openPoint = CGPointMake(height.x - halfWidth, height.y)
            closePoint = CGPointMake(low.x - halfWidth, low.y)
        }
        
        // 开始画实体
        let point1 = openPoint
        let point2 = closePoint
        CGContextStrokeLineSegments(context, [point1, point2], 2) // 绘制线段（默认不绘制端点）

    }
}
