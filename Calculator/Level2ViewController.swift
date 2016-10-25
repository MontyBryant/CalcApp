//
//  Level2ViewController.swift
//  Calculator
//
//  Created by Monty Bryant on 24/10/2016.
//  Copyright © 2016 Monty Bryant. All rights reserved.
//

import UIKit

class Level2ViewController: UIViewController {

    var timer = Timer()
    var counter = 20
    var press = 1
    var imageNames:[String] = ["robot1", "robot2", "alien1", "alien2", "mermaid1", "mermaid2", "dragon1", "dragon2", "unicorn1", "unicorn2", "yeti1", "yeti2"]
    @IBOutlet var countingLabel: UILabel!
    @IBOutlet var imageOne: UIImageView!
    @IBOutlet var imageTwo: UIImageView!
    @IBOutlet var imageThree: UIImageView!
    @IBOutlet var imageFour: UIImageView!
    @IBOutlet var imageFive: UIImageView!
    @IBOutlet var imageSix: UIImageView!
    @IBOutlet var imageSeven: UIImageView!
    @IBOutlet var imageEight: UIImageView!
    @IBOutlet var imageNine: UIImageView!
    @IBOutlet var imageTen: UIImageView!
    @IBOutlet var imageEleven: UIImageView!
    @IBOutlet var imageTwelve: UIImageView!
    
    func hideImages() {
        imageOne.isHidden = true
        imageTwo.isHidden = true
        imageThree.isHidden = true
        imageFour.isHidden = true
        imageFive.isHidden = true
        imageSix.isHidden = true
        imageSeven.isHidden = true
        imageEight.isHidden = true
        imageNine.isHidden = true
        imageTen.isHidden = true
        imageEleven.isHidden = true
        imageTwelve.isHidden = true
    }
    
    func randomiseAllImages() {
        imageOne.image = randomImage()
        imageTwo.image = randomImage()
        imageThree.image = randomImage()
        imageFour.image = randomImage()
        imageFive.image = randomImage()
        imageSix.image = randomImage()
        imageSeven.image = randomImage()
        imageEight.image = randomImage()
        imageNine.image = randomImage()
        imageTen.image = randomImage()
        imageEleven.image = randomImage()
        imageTwelve.image = randomImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countingLabel.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(Level2ViewController.updateCounter), userInfo: nil, repeats: true)
        
        randomiseAllImages()
        hideImages()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateCounter() {
        if counter > 0 {
            counter -= 1
            countingLabel.text = "\(counter)"
        }else{
            counter = 21
            imageNames = ["robot1", "robot2", "alien1", "alien2", "mermaid1", "mermaid2", "dragon1", "dragon2", "unicorn1", "unicorn2", "yeti1", "yeti2"]
            randomiseAllImages()
            hideImages()
        }
    }
    
    @IBAction func refresh(_ sender: UIButton) {
        counter = 0
        updateCounter()
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
        case 2:
            let pickedImage = UIImage(named: imageNames[2])!
            imageNames.remove(at: 2)
            return pickedImage
        case 3:
            let pickedImage = UIImage(named: imageNames[3])!
            imageNames.remove(at: 3)
            return pickedImage
        case 4:
            let pickedImage = UIImage(named: imageNames[4])!
            imageNames.remove(at: 4)
            return pickedImage
        case 5:
            let pickedImage = UIImage(named: imageNames[5])!
            imageNames.remove(at: 5)
            return pickedImage
        case 6:
            let pickedImage = UIImage(named: imageNames[6])!
            imageNames.remove(at: 6)
            return pickedImage
        case 7:
            let pickedImage = UIImage(named: imageNames[7])!
            imageNames.remove(at: 7)
            return pickedImage
        case 8:
            let pickedImage = UIImage(named: imageNames[8])!
            imageNames.remove(at: 8)
            return pickedImage
        case 9:
            let pickedImage = UIImage(named: imageNames[9])!
            imageNames.remove(at: 9)
            return pickedImage
        case 10:
            let pickedImage = UIImage(named: imageNames[10])!
            imageNames.remove(at: 10)
            return pickedImage
        case 11:
            let pickedImage = UIImage(named: imageNames[11])!
            imageNames.remove(at: 11)
            return pickedImage
        default: return UIImage(named: "robot1")!
        }
    }
    

    @IBAction func reveal(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            imageOne.isHidden = false
        case 2:
            imageTwo.isHidden = false
        case 3:
            imageThree.isHidden = false
        case 4:
            imageFour.isHidden = false
        case 5:
            imageFive.isHidden = false
        case 6:
            imageSix.isHidden = false
        case 7:
            imageSeven.isHidden = false
        case 8:
            imageEight.isHidden = false
        case 9:
            imageNine.isHidden = false
        case 10:
            imageTen.isHidden = false
        case 11:
            imageEleven.isHidden = false
        case 12:
            imageTwelve.isHidden = false
        default: break
        }
    }
    
    
}
