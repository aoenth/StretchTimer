//
//  TimerView.swift
//  StretchTimer
//
//  Created by Kevin on 2017-12-04.
//  Copyright © 2017 Monorail Apps. All rights reserved.
//

import UIKit

class TimerView: UIView {
    let counter = BreakTimer(frame: CGRect.zero)
    var startButton: UIButton!
    var startButtonLbl: UILabel!
    let screenSize = UIScreen.main.bounds
    
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
        let buttonWidth = screenSize.width
        let buttonHeight = screenSize.height
        let buttonFrame = CGRect(x: (screenSize.width - buttonWidth)/2, y: (screenSize.height - buttonHeight)/2, width: buttonWidth, height: buttonHeight)
        startButton = UIButton(frame: buttonFrame)
        startButton.backgroundColor = UIColor.purple
        self.addSubview(startButton)
        startButtonLbl = UILabel(frame: CGRect(x: (screenSize.width - buttonWidth*0.8)/2, y: (screenSize.height - buttonHeight)/2, width: buttonWidth*0.8 , height: buttonHeight))
        startButtonLbl.font = startButtonLbl.font.withSize(CGFloat(buttonHeight * 0.618))
        let text = NSMutableAttributedString(string: "Start Stretching", attributes: [NSFontAttributeName: UIFont(name: "AvenirNextCondensed-UltraLight", size: 90)!])
        text.addAttribute(NSForegroundColorAttributeName, value: UIColor.white,
                          range: NSRange(location: 0, length: "Start Stretching".count))
        startButtonLbl.attributedText = text
        startButtonLbl.adjustsFontSizeToFitWidth = true
        startButtonLbl.textAlignment = .natural
        self.addSubview(startButtonLbl)
        startButton.addTarget(self, action: #selector(startStretching), for: .touchUpInside)
        counter.delegate = self
        let g = UISwipeGestureRecognizer(target: self, action: #selector(stopStretching(_ :)))
        self.addGestureRecognizer(g)
        g.delaysTouchesBegan = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startStretching()
    }
    
    func stopStretching(_ gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            if counter.isTimerOn {
                counter.playPause()
            }
            reset()
        }
    }
    
    func startStretching() {
        if counter.counter == 0 || counter.isDone {
            counter.counter = 0
            self.addSubview(counter)
            counter.isDone = false
            counter.backgroundColor = UIColor.white
        }
        counter.playPause()
    }
    
    func reset() {
        counter.backgroundColor = UIColor.clear
        counter.isDone = true
        counter.isTimerOn = false
        counter.progressView.removeFromSuperview()
        counter.timeLbl.text = ""
        counter.counter = 0
        counter.timeLbl.textColor = UIColor.black
    }
}

extension TimerView: WhatIsNextDelegate {
    func endActions() {
        reset()
    }
}
