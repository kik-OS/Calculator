//
//  ViewController.swift
//  Calculator
//
//  Created by Никита Гвоздиков on 09.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var startOfCalculation = true
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign = ""
    var dotIsPlaced = false
    
    var currentInput: Double {
        
        get {
            guard let value = label.text, let number = Double(value) else {return 0}
            return number
        }
        
        set {
            
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                label.text = "\(valueArray[0])"
            } else {
                
                label.text = "\(newValue)"
            }
            startOfCalculation = true
        }
    }
    
    @IBAction func numbersAction(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        
        if startOfCalculation {
            
            label.text = number
            startOfCalculation = false
            
        } else {
            if let value = label.text {
                if value.count <= 16 {
                    label.text? += number
                }
            }
        }
    }
    
    @IBAction func binaryActions(_ sender: UIButton) {
        
        firstOperand = currentInput
        startOfCalculation = true
        
        if let value = sender.currentTitle {
            operationSign = value
        }
        dotIsPlaced = false
    }
    
    @IBAction func resultAction(_ sender: UIButton) {
        
        if !startOfCalculation {
            secondOperand = currentInput
            
            switch operationSign {
            case "+":
                currentInput = firstOperand + secondOperand
            case "-":
                currentInput = firstOperand - secondOperand
            case "×":
                currentInput = firstOperand * secondOperand
            case "÷":
                currentInput = firstOperand / secondOperand
            default:
                break
            }
        }
        dotIsPlaced = false
    }
    
    @IBAction func cleanAction(_ sender: UIButton) {
        currentInput = 0
        firstOperand = 0
        secondOperand = 0
        label.text = "0"
        startOfCalculation = true
        operationSign = ""
        dotIsPlaced = false
    }
    
    
    @IBAction func plusMinusAction(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction func percentAction(_ sender: UIButton) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand * currentInput / 100
        }
    }
    
    @IBAction func pointAction(_ sender: UIButton) {
        
        if !startOfCalculation && !dotIsPlaced {
            label.text = label.text! + "."
            dotIsPlaced = true
        } else if startOfCalculation && !dotIsPlaced {
            label.text = "0."
        }
    }
    
    @IBAction func squareAction(_ sender: UIButton) {
        currentInput = sqrt(currentInput)
    }
}

