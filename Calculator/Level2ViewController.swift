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
    var flipCount = 0
    var imageNames:[String] = ["robot1", "robot2", "alien1", "alien2", "mermaid1", "mermaid2", "dragon1", "dragon2", "unicorn1", "unicorn2", "yeti1", "yeti2"]
    var pressed = 0
    let deck = Deck()
    
    var score: Int = 5
    
    var selectedCards = [Card]()
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var cards: [UIButton]!
    @IBOutlet var countingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.isHidden = true
        
        countingLabel.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(Level2ViewController.updateCounter), userInfo: nil, repeats: true)
        
        deck.shuffle()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func updateCounter() {
        if counter > 0 {
            counter -= 1
            countingLabel.text = "\(counter)"
        }else{
            if score != 6 {
                counter = 21
                flipAllCardsFaceDown()
                deck.shuffle()
                score = 0
                scoreLabel.text = "Score: 0"
            }

        }
    }
    
    
    
    @IBAction func refresh(_ sender: UIButton) {
        counter = 20
        countingLabel.text = "20"
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(Level2ViewController.updateCounter), userInfo: nil, repeats: true)
        
        flipAllCardsFaceDown()
        deck.shuffle()
        
        score = 0
        scoreLabel.text = "Score: 0"
        
        
    }
    
    
    
    
    func randomImage() -> UIImage {
        if imageNames.count > 0 {
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
            default: return UIImage(named: "back")!
            }
        }else{
            return UIImage(named: "back")!
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let infoPage = segue.destination as! InfoPage
        infoPage.passString = "Level 2 Completed! \n \n Level 3 unlocked..."
    }
    
    @IBAction func reveal(_ sender: UIButton) {
        
        let selectedIndex = cards.index(of: sender)!
        let selectedCard = deck.cards[selectedIndex]
        
        if selectedCard.matched {
            return
        }
        
        if selectedCards.count == 0 {
            flip(sender, faceUp: true)
            selectedCards.append(selectedCard)
        } else if selectedCards.count == 1 {
            flip(sender, faceUp: true)
            selectedCards.append(selectedCard)
            
            let isMatch = selectedCards[0].imageName == selectedCards[1].imageName
            
            if isMatch {
                print("We have a match!!")
                score += 1
                scoreLabel.text = "Score: \(score)"
                for card in selectedCards {
                    card.matched = true
                }
                if score == 6 {
                    timer.invalidate()
                    print("You win!")
                    nextButton.isHidden = false
                    countingLabel.text = "You completed level 2 in \(20 - counter) seconds!"
                }
            } else {
                print("Better luck next time :(")
            }

        } else {
            flipAllUnmatchedCardsFaceDown()
            selectedCards.removeAll()
            
            flip(sender, faceUp: true)
            selectedCards.append(selectedCard)
        }
        
    }
    
    func flipAllCardsFaceDown() {
        for card in cards {
            flip(card, faceUp: false)
        }
    }
    
    func flipAllUnmatchedCardsFaceDown() {
        for i in 0..<cards.count {
            if deck.cards[i].matched == false {
                flip(cards[i], faceUp: false)
            }
        }
    }
    
    func flip(_ button: UIButton, faceUp: Bool) {
        if faceUp {
            let index = cards.index(of: button)!
            let card = deck.cards[index]
            let imageName = card.imageName
            button.setBackgroundImage(UIImage(named: imageName), for: .normal)
            button.setTitle("", for: .normal)
        } else {
            button.setBackgroundImage(UIImage(named: "back"), for: .normal)
            button.setTitle("?", for: .normal)
        }
    }
    
}
