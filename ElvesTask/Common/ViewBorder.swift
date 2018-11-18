//
//  ViewBorder.swift
//  ElvesTask
//
//  Created by BinaryBoy on 11/17/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import UIKit

@IBDesignable extension UIView {
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var circleView:Bool {
        get {
            return layer.cornerRadius == min(self.frame.width, self.frame.height) / CGFloat(2.0) ? true : false
        }
        set {
            if newValue {
                layer.cornerRadius = min(self.frame.width, self.frame.height) / CGFloat(2.0)
                layer.masksToBounds = true
            }
            else{
                layer.cornerRadius = 0.0
                layer.masksToBounds = false
            }
        }
    }
}
