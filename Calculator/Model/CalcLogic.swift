//
//  CalcLogic.swift
//  Calculator
//
//  Created by elliott on 3/16/19.
//  Copyright © 2019 Elliott Griffin. All rights reserved.
//

import UIKit

struct CalcLogic {
    
    private var number: Double?
    
    private var intermediateCalc: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return twoNumberCalc(n2: n)
            default:
                intermediateCalc = (n1: n, calcMethod: symbol)
            }
        }
        return nil
        }
    
    private func twoNumberCalc(n2: Double) -> Double? {
        if let n1 = intermediateCalc?.n1,
            let operation = intermediateCalc?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "X":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("operation doesn't have a case")
            }
        }
        return nil
    }
}
