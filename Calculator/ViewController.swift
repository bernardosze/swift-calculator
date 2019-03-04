//
//  ViewController.swift
//  Calculator
//
//  Created by Bernardo Sze on 2019-02-04.
//  Copyright © 2019 Bernardo Sze. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable
    var cornerRadius : CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}

class ViewController: UIViewController {
    
    let ADITION = 10
    let SUBTRACTION = 11
    let MULTIPLICATION = 12
    let DIVISION = 13
    
    @IBOutlet var labelText: UILabel!
    
    var number1 : Double = 0.0
    var number2 : Double = 0.0
    var operand : NSInteger = 0
    var result : Double = 0.0
    
    var printLabel : String = "0"
    
    @IBAction func calculate(sender : UIButton) {
        
        number2 = Double(printLabel)!
        
        switch operand {
            case ADITION:
                result = number1 + number2
            
            case SUBTRACTION:
                result = number1 - number2
            
            case MULTIPLICATION:
                result = number1 * number2
            
            case DIVISION:
                if number2 == 0 {
                    let alert = UIAlertController(title: "Error",
                        message: "Cannot divide by zero",
                        preferredStyle: .alert)
                    
                    let cancelAlert = UIAlertAction(title: "Cancel",
                        style: .cancel,
                        handler: nil)
                    alert.addAction(cancelAlert)
                    present(alert, animated: true)
                } else {
                    result = number1 / number2
                }
        
            default:
                result = number1
        }
        
        number1 = 0
        number2 = 0
        operand = ADITION
        printLabel = String(result)
        displayNumber()
        
        result = 0.0
        printLabel = "0"
        
    }
    
    @IBAction func percentage(sender : UIButton) {
        number2 = Double(printLabel)!
        
        switch operand {
            case ADITION:
                
                result = number1 + (number1 * (number2/100))
            
            case SUBTRACTION:
                
                result = number1 - (number1 * (number2/100))
            
            default:
                result = number1
        }
        
        number1 = 0
        number2 = 0
        operand = ADITION
        printLabel = String(result)
        displayNumber()
        
        result = 0.0
        printLabel = "0"
    }
    
    @IBAction func setOperand(sender : UIButton) {
        if sender.tag >= 10 && sender.tag <= 13 {
            operand = sender.tag
            saveNum1()
        }
        if sender.tag == -2 {
            printLabel = "0"
            displayNumber()
        }
    }
    
    @IBAction func setDouble(sender : UIButton) {
        if sender.tag == -1 {
            printLabel += "."
            displayNumber()
        }
        (sender as? UIButton)?.isEnabled = false
    }
    
    func saveNum1() {
        number1 = Double(printLabel)!
        printLabel = "0"
        displayNumber()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIButton.appearance().cornerRadius = 37.5
        displayNumber()
    }
    
    func displayNumber() {
        labelText.text = printLabel
    }
    
    @IBAction func pressNumber(sender : UIButton) {
        if sender.tag >= 0 && sender.tag <= 9 {
            printLabel += String(sender.tag)
            displayNumber()
        }
    }


}

