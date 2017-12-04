//
//  BreakTimer.swift
//  Disciplines
//
//  Created by Kevin on 2017-09-21.
//  Copyright © 2017 Monorail Apps. All rights reserved.
//

import UIKit
import AudioToolbox

class BreakTimer: UIView {
    var counter = 0.0
    var timer: Timer?
    var isTimerOn = false
    var isDone = false
    var timeInterval: Double!
    let HEIGHT = UIScreen.main.bounds.height
    let WIDTH = UIScreen.main.bounds.width
    var delegate: WhatIsNextDelegate? = nil
    var COUNTDOWN = Double(1*60*60)
    var progressView: UIView!
    var timeLbl: UILabel!
      
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT))
        
        progressView = UIView(frame: CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT))
        progressView.backgroundColor = UIColor.orange
        self.backgroundColor = UIColor.white
        timeInterval = COUNTDOWN/Double(HEIGHT)/100
        timeLbl = UILabel(frame: CGRect(x: WIDTH/2-150, y: HEIGHT/2-100, width: 300, height: 200))
        timeLbl.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 120)
        timeLbl.textAlignment = .center
        timeLbl.adjustsFontSizeToFitWidth = true
        
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func playPause() {
        if isTimerOn {
            timer?.invalidate()
            isTimerOn = false
        } else {
            self.addSubview(progressView)
            timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(updateHeight), userInfo: nil, repeats: true)
            isTimerOn = true
        }
    }


    func updateHeight() {
        let updatedValue = (COUNTDOWN - counter) / COUNTDOWN * Double(HEIGHT)
        progressView.frame.origin.y = CGFloat(updatedValue)
        if counter >= COUNTDOWN {
            timer?.invalidate()
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            delegate?.endActions()
            return
        } else {
            counter += timeInterval
            timeLbl.text = String(format: "%.2f", COUNTDOWN - counter)
            if updatedValue < Double(HEIGHT/2) {
                timeLbl.textColor = UIColor.white
            }
            self.addSubview(timeLbl)
        }
    }
    
}

protocol WhatIsNextDelegate {
    func endActions()
}
