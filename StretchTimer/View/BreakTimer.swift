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
    var countdown = Double(1*60)
    var progressView: UIView!
    var timeLbl: UILabel!
      
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT))
        
        progressView = UIView(frame: CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT))
        progressView.backgroundColor = UIColor.orange
        self.backgroundColor = UIColor.white
        timeInterval = countdown/Double(HEIGHT)
        timeLbl = UILabel(frame: CGRect(x: WIDTH/2-150, y: HEIGHT/2-100, width: 300, height: 200))
        timeLbl.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 120)
        timeLbl.textAlignment = .center
        timeLbl.adjustsFontSizeToFitWidth = false
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


    @objc func updateHeight() {
        let updatedValue = (countdown - counter) / countdown * Double(HEIGHT)
        progressView.frame.origin.y = CGFloat(updatedValue)
        if counter >= countdown {
            timer?.invalidate()
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            delegate?.endActions()
            return
        } else {
            counter += timeInterval
            timeLbl.text = String(format: "%.2f", counter)
            if updatedValue < Double(HEIGHT/2) {
                timeLbl.textColor = UIColor.white
            }
            self.addSubview(timeLbl)
        }
    }
    
    func setCountdownLength(countdown: Double) {
        self.countdown = countdown
    }
    
    func reset() {
        backgroundColor = UIColor.clear
        isDone = true
        isTimerOn = false
        progressView.removeFromSuperview()
        timeLbl.text = ""
        counter = 0
        timeLbl.textColor = UIColor.black
    }
    
    func getCountdownLength(location: CGPoint, divisions: Int) -> Double {
        let yValue = location.y
        let location = ButtonScreenSize.getY(y: yValue, divisions: divisions)
        switch location {
        case 0:
            return 600.0
        case 1:
            return 3600.0
        default:
            return 60.0
        }
    }
    
}

protocol WhatIsNextDelegate {
    func endActions()
}
