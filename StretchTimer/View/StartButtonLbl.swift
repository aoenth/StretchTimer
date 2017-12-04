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
    
    override init(frame: CGRect) {
        let buttonWidth = screenSize.width
        let buttonHeight = screenSize.height
        let rect = CGRect(x: (screenSize.width - buttonWidth*0.8)/2, y: (screenSize.height - buttonHeight)/2, width: buttonWidth*0.8 , height: buttonHeight)
        super.init(frame: frame)
        self.font = self.font.withSize(CGFloat(buttonHeight * 0.618))
        let text = NSMutableAttributedString(string: "Start Stretching", attributes: [NSAttributedStringKey.font: UIFont(name: "AvenirNextCondensed-UltraLight", size: 90)!])
        text.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white,
                          range: NSRange(location: 0, length: "Start Stretching".count))
        self.attributedText = text
        self.adjustsFontSizeToFitWidth = true
        self.textAlignment = .natural
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
