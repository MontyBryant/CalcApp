//
//  Deck.swift
//  Calculator
//
//  Created by Monty Bryant on 26/10/2016.
//  Copyright © 2016 Monty Bryant. All rights reserved.
//

import UIKit
import GameplayKit

class Deck {
    
    var cards: [Card]

    init() {
        cards = [
            Card(imageName: "robot1"),
            Card(imageName: "robot1"),
            Card(imageName: "yeti1"),
            Card(imageName: "yeti1"),
            Card(imageName: "unicorn1"),
            Card(imageName: "unicorn1"),
            Card(imageName: "dragon1"),
            Card(imageName: "dragon1"),
            Card(imageName: "alien1"),
            Card(imageName: "alien1"),
            Card(imageName: "mermaid1"),
            Card(imageName: "mermaid1"),
        ]
    }
    
    func shuffle() {
        for card in cards {
            card.matched = false
        }
        cards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: cards) as! [Card]
    }
}
