//
//  ViewController.swift
//  StretchTimer
//
//  Created by Kevin on 2017-09-21.
//  Copyright © 2017 Monorail Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let counter = BreakTimer(frame: CGRect.zero)
    var startButton: UIButton!
    var startButtonLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isIdleTimerDisabled = true
        
        let screenSize = UIScreen.main.bounds
        let buttonWidth = screenSize.width
        let buttonHeight = screenSize.height
        let buttonFrame = CGRect(x: (screenSize.width - buttonWidth)/2, y: (screenSize.height - buttonHeight)/2, width: buttonWidth, height: buttonHeight)
        startButton = UIButton(frame: buttonFrame)
        startButton.backgroundColor = UIColor.purple
        view.addSubview(startButton)
        startButtonLbl = UILabel(frame: CGRect(x: (screenSize.width - buttonWidth*0.8)/2, y: (screenSize.height - buttonHeight)/2, width: buttonWidth*0.8 , height: buttonHeight))
        startButtonLbl.font = startButtonLbl.font.withSize(CGFloat(buttonHeight * 0.618))
        let text = NSMutableAttributedString(string: "Start Stretching", attributes: [NSFontAttributeName: UIFont(name: "AvenirNextCondensed-UltraLight", size: 90)!])
        text.addAttribute(NSForegroundColorAttributeName, value: UIColor.white,
                          range: NSRange(location: 0, length: "Start Stretching".characters.count))
        startButtonLbl.attributedText = text
        startButtonLbl.adjustsFontSizeToFitWidth = true
        startButtonLbl.textAlignment = .natural
        view.addSubview(startButtonLbl)
        startButton.addTarget(self, action: #selector(startStretching), for: .touchUpInside)
        counter.delegate = self
        let g = UISwipeGestureRecognizer(target: self, action: #selector(stopStretching(_ :)))
        self.view.addGestureRecognizer(g)
        g.delaysTouchesBegan = true
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
            view.addSubview(counter)
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

extension ViewController: WhatIsNextDelegate {
    func endActions() {
        reset()
    }
}



