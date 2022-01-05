//
//  TimerViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 05.01.2022.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var pauseButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var addSeconds: UIButton!
    @IBOutlet var minusSeconds: UIButton!
    
    var timer = Timer()
    var seconds = 60
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startButton(_ sender: Any) {
        //Make sure there arent any others timers running
        timer.invalidate()
        //Create the timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.timerClass), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        timer.invalidate()
        seconds = 60
        timerLabel.text = String(seconds)
    }
    
    @IBAction func addSeconds(_ sender: Any) {
        seconds = seconds + 5
        timerLabel.text = String(seconds)
    }
    
    @IBAction func minusSeconds(_ sender: Any) {
        seconds = seconds - 5
        timerLabel.text = String(seconds)
    }
    
    @objc func timerClass() {
        seconds -= 1
        timerLabel.text = String(seconds)
        
        if (seconds == 0) {
            timer.invalidate()
        }
            
    }
    
}
