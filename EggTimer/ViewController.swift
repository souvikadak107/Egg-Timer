//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLebel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    let eggTime=["Soft":10, "Medium":15, "Hard":20]
    
    var secondeRemender=0
    var timePassed=0
    var timer = Timer()
    //var main=60
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
       
        let hardness=sender.currentTitle!
       

        timer.invalidate()
        
        var timePassed=0
        titleLebel.text=hardness
        progressView.progress=1.0
        
        secondeRemender=eggTime[hardness]!
        
        timer=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    @objc func updateCounter(){
        if timePassed<secondeRemender {
            let percentage = Float(timePassed)/Float(secondeRemender)
            progressView.progress=percentage
            timePassed+=1
        }
        else{
            timer.invalidate()
            titleLebel.text="DONE"
            progressView.progress=1.0
            
        }
    }
    
}
