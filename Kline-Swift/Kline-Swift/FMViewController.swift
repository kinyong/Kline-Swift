//
//  FMViewController.swift
//  Kline-Swift
//
//  Created by Kinyong on 16/7/9.
//  Copyright © 2016年 Ayong. All rights reserved.
//

import UIKit

class FMViewController: UIViewController {
    
    /// 日k按钮
    var btnDay: UIButton!
    
    /// 周k按钮
    var btnWeek: UIButton!
    
    /// 月k按钮
    var btnMonth: UIButton!
    
    // MARK: - 生命周期

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 日k按钮
        btnDay = UIButton(frame: CGRectMake(20, 70, 50, 30))
        btnDay.setTitle("日K", forState: .Normal)
        btnDay.addTarget(self, action: #selector(self.kDayLine), forControlEvents: .TouchUpInside)
        setButtonAttr(btnDay)
        
        self.view.addSubview(btnDay)
        
        // 月k按钮
        btnWeek = UIButton(frame: CGRectMake(75, 70, 50, 30))
        btnWeek.setTitle("周K", forState: .Normal)
        btnWeek.addTarget(self, action: #selector(self.kWeekLine), forControlEvents: .TouchUpInside)
        setButtonAttr(btnWeek)
        
        self.view.addSubview(btnWeek)
        
        // 月k按钮
        btnMonth = UIButton(frame: CGRectMake(75, 70, 50, 30))
        btnMonth.setTitle("月K", forState: .Normal)
        btnMonth.addTarget(self, action: #selector(self.kMonthLine), forControlEvents: .TouchUpInside)
        setButtonAttr(btnMonth)
        
        self.view.addSubview(btnMonth)
        
        // 放大
        let btnBig = UIButton(frame: CGRectMake(185, 70, 50, 30))
        
        btnBig.setTitle("+", forState: .Normal)
        btnBig.addTarget(self, action: #selector(self.kBigLine), forControlEvents: .TouchUpInside)
        
        setButtonAttr(btnBig)
        
        self.view.addSubview(btnBig)
        
        // 缩小
        let btnSmall = UIButton(frame: CGRectMake(240, 70, 50, 30))
        btnSmall.setTitle("-", forState: .Normal)
        btnSmall.addTarget(self, action: #selector(self.kSmallLine), forControlEvents: .TouchUpInside)
        
        setButtonAttr(btnSmall)
        
        self.view.addSubview(btnSmall)
        
        
        // 设置控制器背景颜色
        self.view.backgroundColor = UIColor.colorWithHexString("111111", alpha: 1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - 内部控制方法
    private func setButtonAttr(button: UIButton) {
        button.backgroundColor = UIColor.blackColor()
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    
    @objc private func kDayLine() {

    }

    @objc private func kWeekLine() {
        
    }
    
    @objc private func kMonthLine() {
        
    }
    
    @objc private func kBigLine() {
        
    }
    
    @objc private func kSmallLine() {
        
    }


}
