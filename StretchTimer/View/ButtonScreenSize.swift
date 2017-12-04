//
//  ButtonScreenSize.swift
//  StretchTimer
//
//  Created by Kevin on 2017-12-04.
//  Copyright © 2017 Monorail Apps. All rights reserved.
//

import UIKit

class ButtonScreenSize {


    static func rect(location: Int, divisions: Int) -> CGRect {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let buttonHeight = CGFloat(screenHeight) / CGFloat(divisions)
        let y = buttonHeight * CGFloat(location)
        return CGRect(x: 0, y: y, width: screenWidth, height: buttonHeight)
    }
    
    static func getY(y: CGFloat, divisions: Int) -> Int {
        let screenHeight = UIScreen.main.bounds.height
        let buttonHeight = CGFloat(screenHeight) / CGFloat(divisions)
        return Int(y / buttonHeight)
    }
}
