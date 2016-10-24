//
//  SecretViewController.swift
//  Calculator
//
//  Created by Monty Bryant on 18/10/2016.
//  Copyright © 2016 Monty Bryant. All rights reserved.
//

import UIKit

class SecretViewController: UIViewController {
    
    @IBOutlet var catsName: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newVC: SecondViewController = segue.destination as! SecondViewController
        let passedPhrase = "You named the cat: " + catsName.text!
        newVC.recivedString = passedPhrase
        newVC.unlocked = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
