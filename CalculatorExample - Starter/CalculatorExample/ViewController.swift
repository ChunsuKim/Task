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
    
    
    // MARK: - 숫자키 전부 연결(1...0) 및 출력 함수 구현부
    @IBAction func numButtonAction(_ sender: UIButton) {
        
        // (1자리 숫자연산)입력된 값이 없을 경우 숫자키 titleLabel의 String을 displayText에 입력
        if displayText == nil {
            displayText = (sender.titleLabel?.text)!
        // (2자리 이상 숫자 연산)입력된 값이 있을 경우 titleLabel의 String을 displayText에 + 연산
        } else {
            displayText? += (sender.titleLabel?.text)!
        }
        // label에 displayText값 출력
        displayLabel.text = displayText
    }
    
    // MARK: - AC버튼 연결 및 리셋 함수 구현부
    @IBAction func clearAction(_ sender: UIButton) {
        displayText = nil
        displayLabel.text = "0"
        inputNum = 0
        currentTypingNum = 0
        checkingOperator = nil
    }
    
    // MARK: - 연산 기호 연결(+, -, ×, ÷, =) 및 연산 함수 구현부
    @IBAction func operaion(_ sender: UIButton) {
        if displayText != nil {     // displayText가 nil이 아닐때만 checkingOperation() 실행
            checkingOperation()
            checkingOperator = sender.titleLabel!.text! // 연산기호 버튼을 눌렀을때 연산기호 저장
            displayText = nil       // 연산 완료 후 displayText nil로 초기화
            if sender.titleLabel!.text! == "=" {    // = 이 입력되면 inputNum 출력
                displayLabel.text = String(inputNum)
            }
        } else {
            checkingOperator = sender.titleLabel!.text! // inputNum가 없을 경우 0에 연산결과 출력
        }
    }
    
    // MARK: - 실제 연산할 함수 구현부
    func checkingOperation() {
        if checkingOperator == nil {    // 연산기호 입력이 없을 시
            inputNum = Double(displayText!)!    // 입력된 숫자를 inputNum로 대입
        } else {    // 연산기호가 입력 되었을 시 아래 연산 시작
            currentTypingNum = Double(displayText!)!    // 현재 입력 숫자를 currentTypingNum로 대입
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
