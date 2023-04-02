//
//  ViewLayerProperties.swift
//  WACTest
//
//  Created by Bibin Alex on 03/04/23.
//

import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        } set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.borderColor ?? UIColor.clear.cgColor)
        } set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        } set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.shadowColor ?? UIColor.clear.cgColor)
        } set {
            self.layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        } set {
            self.layer.shadowRadius = newValue
        }
    }
}
