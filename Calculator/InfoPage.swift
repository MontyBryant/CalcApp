//
//  SecondViewController.swift
//  Calculator
//
//  Created by Monty Bryant on 18/10/2016.
//  Copyright © 2016 Monty Bryant. All rights reserved.

import UIKit

class InfoPage: UIViewController {
    
    var passString:String!
    @IBOutlet var passedString: UILabel!
    @IBOutlet var proceedButton: UIButton! //button layerd over back to calc button
    @IBOutlet var proceedButton2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        proceedButton.isHidden = true
        proceedButton2.isHidden = true
        
        passedString.numberOfLines = 4
        passedString.text = passString
        if passedString.text == "Level 2 Unlocked!" {
            proceedButton.isHidden = false
        } else if passedString.text == "Level 2 Completed! \n \n Level 3 unlocked..." {
            proceedButton2.isHidden = false
        } else if passedString.text == "Game Completed!" {
            proceedButton.isHidden = true
            proceedButton2.isHidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()}
    

    
    
    
    
    
    
}
