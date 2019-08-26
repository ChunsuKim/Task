//
//  ViewController.swift
//  UIText
//
//  Created by Chunsu Kim on 26/03/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            firstTextField.becomeFirstResponder()           // 키보드 올라오는 명령어
    }
    
    @IBAction private func signIn(_ sender: Any) {
//        firstTextField.resignFirstResponder()             // 키보드 내려가는 명령어
        view.endEditing(true)
    }
    
    
    @IBAction func editingDidBegin(_ sender: UITextField) {
        print("editing did begin")
        sender.font = UIFont.boldSystemFont(ofSize: 25)
        sender.textAlignment = .center
    }
    
    var tfTextBackup = ""               // 10글자가 넘었을때 막는 변수선언
    @IBAction func editingChanged(_ sender: UITextField) {
        print("editing changed")
        
        if sender == firstTextField {
            print(sender.text?.count)
        } else if sender.tag == 2 {
            print(sender.text)
        }
 
// 1단계 : 10글자가 넘었는지 아닌지 판단

// 2단계 : 10글자가 넘으면 입력이 안 되도록 또는 입력이 안 된 것처럼 보이도록 구현
        
        
        guard var text = sender.text else { return }
        if text.count > 10 {
            // 1번째 방법
//            text.removeLast()
//            sender.text = text // 11번째 마지막 글자를 삭제하고 10번째까지만      * 문제점 copy and paste를 막을수 없음
            
            // 2번째 방법
          sender.text = tfTextBackup
        } else {
          tfTextBackup = text
        }
        

    }
    
    @IBAction func didEndOnExit(_ sender: Any) {
        print("did end on exit")
    }           // 리턴키를 눌렀을때 키보드창 내려주기
    @IBAction func primaryActionTriggered(_ sender: Any) {
        print("primary action triggered")
    }
    @IBAction func editingDidEnd(_ sender: Any) {
        print("editing did end")
    }
    

}

