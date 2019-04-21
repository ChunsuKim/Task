//
//  ViewController.swift
//  BasicCalculator
//
//  Created by Chunsu Kim on 19/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var firstNumTextField: UITextField!
    @IBOutlet weak var operatorTextField: UITextField!
    @IBOutlet weak var secondNumTextField: UITextField!
    @IBOutlet weak var resultButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultButton.layer.cornerRadius = 10
       
    }
    
    // MARK: - TextField Function 연결
    @IBAction func firstNuminput(_ sender: UITextField) {
        
    }
    
    @IBAction func operatorinput(_ sender: UITextField) {
    }
    
    @IBAction func secondNuminput(_ sender: UITextField) {
    }
    
    
    
    // MARK: - Button 연결
    @IBAction func calculation(_ sender: UIButton) {
        let (title, message) = calculateOperation()
        alert(title: title, message: message)
        
    }
    
    // MARK: - calcultation function
    private func calculateOperation() -> (String, String) {
        guard let leftOperand = firstNumTextField.text,
        let rightOperand = secondNumTextField.text,
        let leftNum = Double(leftOperand),
        let rightNum = Double(rightOperand)
        else { return ("Numbering Error", "Typing Any Number.") }
        guard let op = operatorTextField.text, op.count == 1 else {
            return ("Operation Error", "Typing Operation choosing by (+, -, *, /)")
        }
        
        let result: Double
        
        switch op {
        case "+": result = leftNum + rightNum
        case "-": result = leftNum - rightNum
        case "*": result = leftNum * rightNum
        case "/": result = leftNum / rightNum
        default: return ("Operation Error", "Typing Operation. (+, -, *, /)")
        }
        return ("Result", "\(leftNum) \(op) \(rightNum) = \(String(format: "%.3f", result))")
        
    }
    
    // MARK: - AlertController 구현부
    func alert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}

