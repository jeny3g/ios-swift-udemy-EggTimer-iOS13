//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12

    @IBAction func hardnessSelectefd(_ sender: UIButton) {
        
        let title = sender.currentTitle
        
        if(title == "Soft"){
            print(softTime)
        } else if (title == "Medium"){
            print(mediumTime)
        } else if(title == "Hard"){
            print(hardTime)
        }
    
    }
    
}
