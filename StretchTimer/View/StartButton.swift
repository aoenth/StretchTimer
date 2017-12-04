//
//  TimerView.swift
//  StretchTimer
//
//  Created by Kevin on 2017-12-04.
//  Copyright © 2017 Monorail Apps. All rights reserved.
//

import UIKit

class StartButton: UIView {
    let screenSize = UIScreen.main.bounds
    
    override init(frame: CGRect) {
        let buttonWidth = screenSize.width
        let buttonHeight = screenSize.height
        let buttonFrame: CGRect
        if frame == CGRect.zero {
            buttonFrame = CGRect(x: (screenSize.width - buttonWidth)/2, y: (screenSize.height - buttonHeight)/2, width: buttonWidth, height: buttonHeight)
        } else {
            buttonFrame = frame
        }
        super.init(frame: buttonFrame)
        
        let randomNumber = arc4random_uniform(6)
        var backgroundColor: UIColor
        switch randomNumber {
        case 0:
            backgroundColor = UIColor.blue
        case 1:
            backgroundColor = UIColor.red
        case 2:
            backgroundColor = UIColor.green
        case 3:
            backgroundColor = UIColor.cyan
        case 4:
            backgroundColor = UIColor.yellow
        default:
            backgroundColor = UIColor.magenta
        }
        self.backgroundColor = backgroundColor

        self.layer.cornerRadius = 5
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


