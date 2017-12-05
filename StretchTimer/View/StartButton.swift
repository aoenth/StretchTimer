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

        self.layer.cornerRadius = 5
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


