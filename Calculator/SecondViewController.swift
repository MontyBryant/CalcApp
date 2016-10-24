//
//  SecondViewController.swift
//  Calculator
//
//  Created by Monty Bryant on 18/10/2016.
//  Copyright © 2016 Monty Bryant. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var passedString: UILabel!
    var recivedString = String()
    var unlocked = Bool()

    @IBAction func yesHint(_ sender: UIButton) {
        hideButtonYes.isHidden = true
        hideButtonNo.isHidden = true
        passedString.text = "I am 6,494 days old. What is my year of birth?"
    }
    
    @IBOutlet var hideButtonYes: UIButton!
    @IBOutlet var hideButtonNo: UIButton!
    @IBOutlet var hideCat: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideButtonYes.isHidden = false
        hideButtonNo.isHidden = false
        hideCat.isHidden = true
        
        passedString.numberOfLines = 3

        if unlocked == true {
            passedString.text = recivedString
            hideButtonYes.isHidden = true
            hideButtonNo.isHidden = true
            hideCat.isHidden = false
        }else{
            passedString.text = "The aim of this app is to unlock the secret page... Need a hint?"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
