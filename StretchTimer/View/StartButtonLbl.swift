//
//  StartButtonLbl.swift
//  StretchTimer
//
//  Created by Kevin on 2017-12-04.
//  Copyright © 2017 Monorail Apps. All rights reserved.
//

import UIKit

class StartButtonLbl: UILabel {
    let screenSize = UIScreen.main.bounds
    var labelString: String?
    var fontColor: UIColor?
    var labelText: NSMutableAttributedString?
    
    override init(frame: CGRect) {
        let buttonHeight = screenSize.height
        super.init(frame: frame)
        self.font = self.font.withSize(CGFloat(buttonHeight * 0.618))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setString(labelString: String) {
        self.labelString = labelString
        labelText = NSMutableAttributedString(string: labelString, attributes: [NSAttributedStringKey.font: UIFont(name: "AvenirNextCondensed-UltraLight", size: 90)!])
    }
    
    func reflectFontColor(color: UIColor) {
        switch color {
        case UIColor.blue, UIColor.red, UIColor.magenta:
            fontColor = UIColor.white
        default:
            fontColor = UIColor.black
        }
        if let labelString = labelString {
            if let labelText = labelText {
                if let fontColor = fontColor {
                    labelText.addAttribute(NSAttributedStringKey.foregroundColor, value: fontColor,
                                           range: NSRange(location: 0, length: labelString.count))
                    self.attributedText = labelText
                    self.adjustsFontSizeToFitWidth = true
                    self.textAlignment = .natural
                } else {
                    print("No fontColor")
                }
            } else {
                print("Empty labelText")
            }
        } else {
            print("Empty labelString")
        }
        
    }
}
