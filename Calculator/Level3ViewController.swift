//
//  Level3ViewController.swift
//  Calculator
//
//  Created by Monty Bryant on 26/10/2016.
//  Copyright © 2016 Monty Bryant. All rights reserved.
//

import UIKit

class Level3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        clickMeButtonOutlet.isEnabled = false
        nextButton.isHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var clickCount = 0
    var counter = 20
    var timer = Timer()
    var pressed = false
    
    @IBOutlet var numberOfClicks: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var clickMeButtonOutlet: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    @IBAction func startTimer(_ sender: AnyObject) {
        clickCount = 0
        clickMeButtonOutlet.isEnabled = true
        counter = 20
        numberOfClicks.text = "Number of clicks: 0"
        timerLabel.text = String(counter)
        if pressed == false {
            timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(Level2ViewController.updateCounter), userInfo: nil, repeats: true)
            pressed = true
        }
    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        clickCount += 1
        numberOfClicks.text = "Number of clicks: \(clickCount)"
    }
    
    func updateCounter() {
        if counter > 0 {
            counter -= 1
            timerLabel.text = "\(counter)"
        }else{
            timerLabel.text = "Times Up"
            numberOfClicks.text = "Final Score: \(clickCount)"
            clickMeButtonOutlet.isEnabled = false
            if clickCount > 100 {
                
                nextButton.isHidden = false
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let infoPage = segue.destination as! InfoPage
        infoPage.passString = "Game Completed!"
    }
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
