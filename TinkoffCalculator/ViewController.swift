//
//  ViewController.swift
//  TinkoffCalculator
//
//  Created by t.khamidov on 15.11.2020.
//  Copyright © 2020 Tinkoff Bank. All rights reserved.
//

import UIKit

enum CalculationError: Error {
    case dividedByZero
}

enum Operation {
    case add
    case substract
    case multiply
    case divide
    
    func calculate(_ number1: Double, _ number2: Double) throws -> Double {
        switch self {
        case .add:
            return number1 + number2
            
        case .substract:
            return number1 - number2
            
        case .multiply:
            return number1 * number2
            
        case .divide:
            if number2 == 0 {
                throw CalculationError.dividedByZero
            }
            
            return number1 / number2
        }
    }
}

enum CalculationHistoryItem {
    case number(Double)
    case operation(Operation)
}

class ViewController: UIViewController {
    
    var calculationHistory: [CalculationHistoryItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label.text = "0"
    }
    
    @IBOutlet var label: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let buttonText = sender.currentTitle else { return }
        
        print(buttonText)
        
        if let labelText = label.text, labelText == "0" {
            label.text = buttonText
        } else {
            label.text?.append(buttonText)
        }
    }
    
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        guard
            let buttonText = sender.currentTitle,
            let labelText = label.text,
            let labelNumber = formatNumber(labelText)
            else { return }
        
        var operation: Operation
        
        switch buttonText {
        case "+":
            operation = .add
        case "-":
            operation = .substract
        case "x":
            operation = .multiply
        case "/":
            operation = .divide
        default:
            return
        }
        
        calculationHistory.append(.number(labelNumber))
        calculationHistory.append(.operation(operation))
        
        label.text = "0"
    }
    
    @IBAction func resultButtonPressed(_ sender: UIButton) {
        guard
            let labelText = label.text,
            let labelNumber = formatNumber(labelText)
            else { return }
        
        calculationHistory.append(.number(labelNumber))
        
        do {
            let result = try calculateResult()
            let labelText = formatNumber(result)
            
            label.text = labelText
        } catch {
            label.text = "Ошибка"
        }
        
        calculationHistory.removeAll()
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        calculationHistory.removeAll()
        
        label.text = "0"
    }
    
    func calculateResult() throws -> Double {
        var result: Double = 0
        var lastOperation: Operation?
        
        try calculationHistory.forEach { calculationHistoryItem in
            switch calculationHistoryItem {
            case .number(let number):
                if let operation = lastOperation {
                    result = try operation.calculate(result, number)
                } else {
                    result = number
                }
                
            case .operation(let operation):
                lastOperation = operation
            }
        }
        
        return result
    }
    
    func formatNumber(_ number: String) -> Double? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.numberStyle = .decimal
        
        return formatter.number(from: number)?.doubleValue
    }
    
    func formatNumber(_ number: Double) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.numberStyle = .decimal
        
        return formatter.string(from: NSNumber(value: number))
    }
}

