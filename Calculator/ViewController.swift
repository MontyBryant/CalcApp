//
//  ViewController.swift
//  Calculator
//
//  Created by Monty Bryant on 13/10/2016.
//  Copyright © 2016 Monty Bryant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
    private var userIsTyping = false
    private var secretCode = "1998"
    private var symbol: Int = 0
    private var decimalPoint: String!
    private var decimal = true
    private var buttonPressed = String()
    private var num1 = Double()
    private var num2 = Double()
    private var displayValue: Double{
        get{
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTyping == true{
            let textInDisplay = display.text!
            display.text = textInDisplay + digit
        }else{
            display.text = digit
        }
        userIsTyping = true
    }
    
    @IBAction private func clear(_ sender: UIButton) {
        userIsTyping = false
        display.text = "0"
        decimal = true
    }
    
    @IBAction func plus(_ sender: UIButton) {
        num1 = displayValue
        userIsTyping = false
        buttonPressed = sender.currentTitle!
        switch buttonPressed {
        case "+":
            symbol = 0
            display.text = "0"
        case "-":
            symbol = 1
            display.text = "0"
        case "x":
            symbol = 2
            display.text = "0"
        case "÷":
            symbol = 3
            display.text = "0"
        case ".":
            if decimal == true{
                symbol = 4
                decimalPoint = "\(display.text!)."
                display.text = decimalPoint
                userIsTyping = true
                decimal = false
            }else{
                print("Cannot put deciaml here")
            }
        case "π": display.text = String(M_PI)
        case "e": display.text = String(M_E)
        case "√":
            let squareRoot = Double(display.text!)
            let squareRootAns = sqrt(squareRoot!)
            displayValue = squareRootAns
        default: break
        }
    }

    
    @IBAction func equals(_ sender: UIButton) {
        if display.text == secretCode {
            print("Secret Page Unlocked")
            self.performSegue(withIdentifier: "segue", sender: self)
        }else{
            num2 = displayValue
            userIsTyping = false
            decimal = true
            switch symbol {
            case 0: displayValue = num1 + num2
            case 1: displayValue = num1 - num2
            case 2: displayValue = num1 * num2
            case 3: displayValue = num1 / num2
            default: break
            }
        }
    }

    @IBAction func LongPress(_ sender: UILongPressGestureRecognizer) {
        print("Secret Page Unlocked")
        self.performSegue(withIdentifier: "segue", sender: self)
    }
    

}

