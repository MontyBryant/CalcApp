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
    var counter = 15
    var flipCount = 0
    var imageNames:[String] = ["robot1", "robot2", "alien1", "alien2", "mermaid1", "mermaid2", "dragon1", "dragon2", "unicorn1", "unicorn2", "yeti1", "yeti2"]
    var pressed = 0
    let deck = Deck()
    
    var score: Int = 0
    
    var selectedCards = [Card]()
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var cards: [UIButton]!
    @IBOutlet var flipsLabel: UILabel!
    @IBOutlet var countingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.isHidden = true
        
        countingLabel.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(Level2ViewController.updateCounter), userInfo: nil, repeats: true)
        
        deck.shuffle()
        
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
            counter = 16
            flipAllCardsFaceDown()
            deck.shuffle()
            score = 0
            scoreLabel.text = "Score: 0"

        }
    }
    
    
    
    @IBAction func refresh(_ sender: UIButton) {
        flipAllCardsFaceDown()
        deck.shuffle()
        
        score = 0
        scoreLabel.text = "Score: 0"
        
        counter = 15
        countingLabel.text = "15"
        
//        for card in cards { //for each 'card' in cards flip them
//            card.setBackgroundImage(UIImage(named: "back"), for: .normal)
//            card.setTitle("?", for: .normal)
//        }
//        counter = 0
//        updateCounter()
//        imageNames = ["robot1", "robot2", "alien1", "alien2", "mermaid1", "mermaid2", "dragon1", "dragon2", "unicorn1", "unicorn2", "yeti1", "yeti2"]
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
    
    func examplesOfFunctions() {
        // scratchpad to show use of different functions
        
        // note how this method would not read well without "title"
        let newButton = createNewButton(title: "Hello")
        
        add(newButton, to: view) // view is self.view
        // in objective c: [self addButton: newButton toView: self.view] - swift reads more like natural language
        
        hide(newButton)
    }
    
    // returns a UIButton instance
    // -> UIButton indicates the return type
    func createNewButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        return button
    }
    
    // using an underscore removes repetition (hide(button: newButton))
    func hide(_ button: UIButton) {
        button.isHidden = true
    }
    
    // when used this will be add(button, to: view) but the 'button' and 'view' names give us clear names in the method (rather than to.addSubview(button)
    func add(_ button: UIButton, to view: UIView) {
        view.addSubview(button)
    }
    
    @IBAction func nextPage(_ sender: UIButton) {
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
                    print("You win!")
                    nextButton.isHidden = false
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
        
        
        
//        if previouslySelectedCard == nil  {
//            flip(sender, faceUp: true)
//            previouslySelectedCard = selectedCard
//        } else {
//            flip(sender, faceUp: true)
//            
//            let isMatch = previouslySelectedCard!.imageName == selectedCard.imageName
//            
//            if isMatch {
//                print("We have a match!!")
//            } else {
//                print("Better luck next time :(")
//            }
//
//        }
        
//        flipCount += 1
//        flipsLabel.text = "Flips: \(flipCount)"
//        
//        if flipCount % 2 == 0 || flipCount == 1 {
//        } else{
//            for card in cards { //for each 'card' in cards flip them
//                card.setBackgroundImage(UIImage(named: "back"), for: .normal)
//                card.setTitle("?", for: .normal)
//            }
//        }
//        
//        if imageNames.count == 0 {
//            imageNames = ["robot1", "robot2", "alien1", "alien2", "mermaid1", "mermaid2", "dragon1", "dragon2", "unicorn1", "unicorn2", "yeti1", "yeti2"]
//        }
//        if sender.currentTitle == "?" {
//            //sender.setBackgroundImage(randomImage(), for: .normal)
//            let index = cards.index(of: sender)!
//            let card = deck.cards[index]
//            let imageName = card.imageName
//            sender.setBackgroundImage(UIImage(named: imageName), for: .normal)
//            sender.setTitle("", for: .normal)
//        }else{
//            sender.setBackgroundImage(UIImage(named: "back"), for: .normal)
//            sender.setTitle("?", for: .normal)
//        }
//    }
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
