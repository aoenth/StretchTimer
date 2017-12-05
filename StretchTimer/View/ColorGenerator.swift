//
//  ColorGenerator.swift
//  StretchTimer
//
//  Created by Kevin on 2017-12-04.
//  Copyright © 2017 Monorail Apps. All rights reserved.
//

import UIKit

class ColorGenerator {
    static func generateColors(numberOfColors: Int) -> [UIColor] {
        let numberOfColorsInt = UInt32(numberOfColors)
        var colors = [UIColor]()
        var color: UIColor
        var i = 0
        while(i < numberOfColors) {
            var randomNumber = arc4random_uniform(numberOfColorsInt)
            randomNumber = randomNumber > 6 ? 6 : randomNumber
            switch randomNumber {
            case 0:
                color = UIColor.blue
            case 1:
                color = UIColor.red
            case 2:
                color = UIColor.green
            case 3:
                color = UIColor.cyan
            case 4:
                color = UIColor.yellow
            default:
                color = UIColor.magenta
            }
            if (!colors.contains(color) && numberOfColors <= 6) || (colors.last != color && numberOfColors > 6){
                colors.append(color)
                i += 1
            }

        }
        return colors
    }
}
