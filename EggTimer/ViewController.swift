//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    let eggTimes: [String : Float] = ["Soft": 300, "Medium": 420, "Hard": 720]
        
    var timer = Timer()
    var totalTime: Float = 0
    var secondsPassed: Float = 0
    

    
    @IBAction func hardnessSelectefd(_ sender: UIButton) {
        resetTimerAndProgressbar()
        
        let hardness = sender.currentTitle! // Soft, Medium, Hard
        mainTitle.text = hardness
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer(){
        if (secondsPassed < totalTime) {
            secondsPassed += 1

            progressBar.progress =  secondsPassed / totalTime;
            
        } else {
            onTimeFinished()
        }
    }
    
    func onTimeFinished(){
        resetTimerAndProgressbar()
        mainTitle.text = "DONE!"
        
        playAlarmSound()
    }
    
    func resetTimerAndProgressbar(){
        timer.invalidate()
        totalTime = 0
        secondsPassed = 0
        progressBar.progress = 0
    }
    
    func playAlarmSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
}
