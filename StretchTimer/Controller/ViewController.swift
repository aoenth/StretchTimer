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
    let screenSize = UIScreen.main.bounds
    var buttons = [StartButton]()
    let numberOfButtons = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isIdleTimerDisabled = true

//        let buttonColors = ColorGenerator.generateColors(numberOfColors: numberOfButtons)
//        print("buttonColors: ", buttonColors[0])
        for i in 0..<numberOfButtons {
            let tempRect = ButtonScreenSize.rect(location: i, divisions: numberOfButtons)
            let startButton = StartButton(frame: tempRect)
//            startButton.backgroundColor = buttonColors[i]
            self.view.addSubview(startButton)
            buttons.append(startButton)
        }
        
//        let startButtonLbl = StartButtonLbl(frame: CGRect.zero)
//        self.view.addSubview(startButtonLbl)

        counter.delegate = self
        let g = UISwipeGestureRecognizer(target: self, action: #selector(stopStretching(_ :)))
        self.view.addGestureRecognizer(g)
        g.delaysTouchesBegan = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let choice = touches.first?.location(in: self.view)
        if counter.counter == 0 || counter.isDone {
            let countdownLength = counter.getCountdownLength(location: choice!, divisions: numberOfButtons)
            counter.setCountdownLength(countdown: countdownLength)
        }
        startStretching()
    }
    
    @objc func stopStretching(_ gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            if counter.isTimerOn {
                counter.playPause()
            }
            counter.reset()
        }
    }
    
    @objc func startStretching() {
        if counter.counter == 0 || counter.isDone {
            counter.counter = 0
            self.view.addSubview(counter)
            counter.isDone = false
            counter.backgroundColor = UIColor.white
        }
        counter.playPause()
    }
    

    
}

extension ViewController: WhatIsNextDelegate {
    func endActions() {
        counter.reset()
    }
}

