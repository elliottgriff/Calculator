//
//  ViewController.swift
//  Calculator
//
//  Created by elliott on 3/11/19.
//  Copyright © 2019 Elliott Griffin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    
    private var finishedEnteringNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(numberLabel.text!) else {
                fatalError("can't convert label to Double")
            }
            return number
        }
        set {
            numberLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalcLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //non-number button pressed
        finishedEnteringNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcWork = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcWork) {
                displayValue = result
            }
            
        }
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        //number button pressed
        
        if let numberValue = sender.currentTitle {
            
            if finishedEnteringNumber {
                numberLabel.text = numberValue
                finishedEnteringNumber = false
            } else {
                if numberValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                numberLabel.text = numberLabel.text! + numberValue
            }
            
            
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

