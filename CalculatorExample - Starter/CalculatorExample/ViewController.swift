//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 17/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var displayLabel: UILabel!   // storyboard Label 연결
    var displayText: String? = nil  // label에 출력될 값을 결정할 변수
    var checkingOperator: String? = nil // 연산 기호를 저장해둘 변수
    var inputNum: Double = 0    // 입력된 과거 변수
    var currentTypingNum: Double = 0    // 입력하는 현재 변수
    

  override func viewDidLoad() {
    super.viewDidLoad()
    displayLabel.text = "0"
  }
    
    
    // MARK: - 숫자키 전부 연결(1...0)
    @IBAction func numButtonAction(_ sender: UIButton) {
        
        // (1자리 숫자연산)입력된 값이 없을 경우 숫자키 titleLabel의 String을 displayText에 입력
        if displayText == nil {
            displayText = (sender.titleLabel?.text)!
        // (2자리 이상 숫자 연산)입력된 값이 있을 경우 titleLabel의 String을 displayText에 + 연산
        } else {
            displayText? += (sender.titleLabel?.text)!
        }
        displayLabel.text = displayText
    }
    
    @IBAction func clearAction(_ sender: UIButton) {
        displayText = nil
        displayLabel.text = "0"
        inputNum = 0
        currentTypingNum = 0
        checkingOperator = nil
    }
    
    @IBAction func operaion(_ sender: UIButton) {
        if displayText != nil {
            checkingOperation()
            checkingOperator = sender.titleLabel!.text!
            displayText = nil
            if sender.titleLabel!.text! == "=" {
                displayLabel.text = String(inputNum)
            }
        } else {
            checkingOperator = sender.titleLabel!.text!
        }
    }
    
    func checkingOperation() {
        if checkingOperator == nil {
            inputNum = Double(displayText!)!
        } else {
            currentTypingNum = Double(displayText!)!
            if checkingOperator == "+" {
                inputNum += currentTypingNum
            } else if checkingOperator == "-" {
                inputNum -= currentTypingNum
            } else if checkingOperator == "×" {
                inputNum *= currentTypingNum
            } else if checkingOperator == "÷" {
                inputNum /= currentTypingNum
            }
            
            displayLabel.text = String(inputNum)
            
        }
        
    }
    
}
