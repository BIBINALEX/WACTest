//
//  Strikethrough.swift
//  WACTest
//
//  Created by Bibin Alex on 02/04/23.
//

import UIKit

extension UILabel{
    func strikethrough(_ strikeColor: UIColor? = nil){
        if let text{
            let attributedText = NSMutableAttributedString(string: text)
            let range = NSRange(location: 0, length: text.count)

            attributedText.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: range)
            attributedText.addAttribute(NSAttributedString.Key.strikethroughColor, value: strikeColor ?? self.textColor ?? .label, range: range)

            self.attributedText = attributedText
        }
    }
}
