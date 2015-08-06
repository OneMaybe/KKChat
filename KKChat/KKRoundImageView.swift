//
//  KKRoundImageView.swift
//  KKChat
//
//  Created by jensen on 15/8/7.
//  Copyright (c) 2015年 KellenYang. All rights reserved.
//

import UIKit
//实时渲染
@IBDesignable
class KKRoundImageView: UIImageView {
    //出现在SB中
    @IBInspectable var cornerRdius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRdius
            layer.masksToBounds = cornerRdius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.blackColor() {
        didSet{
            layer.borderColor = borderColor.CGColor
        }
    }
}
