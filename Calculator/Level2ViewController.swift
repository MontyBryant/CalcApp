//
//  Level2ViewController.swift
//  Calculator
//
//  Created by Monty Bryant on 24/10/2016.
//  Copyright © 2016 Monty Bryant. All rights reserved.
//

import UIKit

class Level2ViewController: UIViewController {
    
    @IBOutlet var countingLabel: UILabel!
    var timer = Timer()
    var counter = 20
    var imageNames:[String] = ["robot1", "robot2"]
    
    func updateCounter() {
        if counter > 0 {
            counter -= 1
            countingLabel.text = "\(counter)"
        }else{
            counter = 20
            imageNames = ["robot1", "robot2"]
            imageOne.isHidden = true
            imageTwo.isHidden = true
        }
    }
    
    func randomImage() -> UIImage {
        let time = UInt32(NSDate().timeIntervalSinceReferenceDate)
        arc4random_uniform(time)
        let randomNumber = arc4random()%UInt32(imageNames.count)
        let randomInt = Int(randomNumber)
    
        switch randomInt {
        case 0:
            let pickedImage = UIImage(named: imageNames[0])!
            imageNames.remove(at: 0)
            return pickedImage
        case 1:
            let pickedImage = UIImage(named: imageNames[1])!
            imageNames.remove(at: 1)
            return pickedImage
        default: return UIImage(named: "robot1")!
        }
    }

    
    @IBOutlet var imageOne: UIImageView!
    @IBOutlet var imageTwo: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countingLabel.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(Level2ViewController.updateCounter), userInfo: nil, repeats: true)
        
        imageOne.isHidden = true
        imageTwo.isHidden = true


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func reveal(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            imageOne.isHidden = false
            imageOne.image = randomImage()
        case 2:
            imageTwo.isHidden = false
            imageTwo.image = randomImage()
        default: break
        }
    }
    
    
    
    
}
