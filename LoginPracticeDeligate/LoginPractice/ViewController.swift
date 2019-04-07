//
//  ViewController.swift
//  LoginPractice
//
//  Created by Chunsu Kim on 05/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

class User {
    let name: String
    let email: String
    let password: String
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}


import UIKit

class ViewController: UIViewController, UITextFieldDelegate {       // Delegate 선언

    // user signin 정보
    let users: [User] = [
    User(name: "김천수", email: "chunsu0816@gmail.com", password: "1234"),
    User(name: "권혁태", email: "abab@gmail.com", password: "abab"),
    User(name: "정진배", email: "jjb8382@gmail.com", password: "abcd"),
    User(name: "고정아", email: "kja1234@gmail.com", password: "abcd")
    ]
    
    // 스토리보드로 만든 텍스트필드, 버튼, 뷰 연결
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var viewForEmailPassword: UIView!
    
    // 텍스트필드를 활성화 시킬때 뷰가 이동하는 변수 지정
    var slidingUpViewForEmailPassword = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // email 입력모드로 키보드적용
        emailTextField.keyboardType = UIKeyboardType.emailAddress
        // 키보드 색상 어두운걸로 적용
        emailTextField.keyboardAppearance = UIKeyboardAppearance.dark
        // 문자를 입력하지 않았을때 리턴키 비활성화 적용
        emailTextField.enablesReturnKeyAutomatically = true
        // 내부에 클리어 버튼 표시
        emailTextField.clearButtonMode = UITextField.ViewMode.always
        
        // 비밀번호 입력할때 입력된문자를 보안해주는 모드
        passwordTextField.isSecureTextEntry = true
        passwordTextField.keyboardAppearance = UIKeyboardAppearance.dark
        passwordTextField.enablesReturnKeyAutomatically = true
        passwordTextField.clearButtonMode = UITextField.ViewMode.always
        // 키보드 타입 영문자 패드로
        passwordTextField.keyboardType = UIKeyboardType.alphabet
        

        // Delegate 지정
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        }

    // 텍스트 필드의 편집이 시작된 후 호출
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("택스트 필드의 편집이 시작되었습니다.")
        
        // 뷰위치 위로 이동 구현
        guard slidingUpViewForEmailPassword == false else { return }
        UIView.animate(withDuration: 0.3) {
            self.viewForEmailPassword.frame.origin.y -= 250
            self.slidingUpViewForEmailPassword = true
        }
    }
    
    // 텍스트 필드의 내용이 변경될 때 호출
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("텍스트 필드의 내용이 \(string)으로 변경됩니다.")
        
        // 현재 텍스트필드에 입력된 길이와 더해질 문자의 길이의 합이 20을 넘는다면 반영하지 않음
        if (textField.text?.count)! + string.count > 21 {
            return false
        } else {
            return true
            }
       
        }
    
    
    // 이메일과 비밀번호가 일치할 경우 SecondViewController로 signin 일치하지 않을 경우 alert창 띄움
    @IBAction func signin(_ sender: UIButton) {
        guard let id = emailTextField.text, !id.isEmpty else {
            alert(title: "이메일 주소가 누락되었습니다.", message: "이메일 주소를 입력해주세요.")
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            alert(title: "비밀번호가 누락되었습니다.", message: "비밀번호를 입력해주세요.")
            return
        }
        
        for user in users {
            if user.email == id && user.password == password {
                print("Signin Success")
                
                let secondViewController = SecondViewController()
                secondViewController.currentUser = user
                present(secondViewController, animated: true, completion: nil)
                return
            }
        }
        
        alert(title: "Sign in 정보가 일치하지 않습니다.", message: "다시 입력해주세요.")
    }
        
        
    // alert창 구현
    func alert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    
    
    // 텍스트 필드의 리턴키가 눌러졌을 때 호출
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("텍스트 필드의 리턴키가 눌러졌습니다.")
        
        // 뷰위치 아래로 이동 구현
        UIView.animate(withDuration: 0.3) {
            self.viewForEmailPassword.frame.origin.y += 250
        }
        slidingUpViewForEmailPassword = false
        return true
    }
    
}

