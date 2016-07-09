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
    var points: NSArray?     /// 多点连线数组
    var color: String!        /// 线条颜色
    var lineWidth: CGFloat!  /// 线条宽度
    var isK = false          /// 是否是实体K线，默认是连接线
    var isVol = false        /// 是否是化成交量的实体
    
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
        }
        
    }
    
    // MARK: -内部方法
    func initSubView(){
        startPoint = self.frame.origin
        endPoint = self.frame.origin
        color = "#000000"
        lineWidth = 1.0
        isK = false
        isVol = false
    }

}
