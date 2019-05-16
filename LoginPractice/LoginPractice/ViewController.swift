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

class ViewController: UIViewController {
    
    let users: [User] = [
    User(name: "김천수", email: "chunsu0816@gmail.com", password: "1234"),
    User(name: "권혁태", email: "abab@gmail.com", password: "abab"),
    User(name: "정진배", email: "jjb8382@gmail.com", password: "abcd"),
    User(name: "고정아", email: "kja1234@gmail.com", password: "abcd")
    ]
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    @IBAction func signin(_ sender: UIButton) {
        guard let id = emailTextField.text, !id.isEmpty else {
            alert(title: "이메일 주소가 누락되었습니다.", message: "이메일 주소를 입력해주세요.")
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            alert(title: "비밀번호가 누락되었습니다.", message: "비밀번호를 입력해주세요.")
            return
        }
        
        users.forEach {
            if $0.email == id && $0.password == password {
                print("Signin Success")
                
                let secondViewController = SecondViewController()
                secondViewController.currentUser = $0
                present(secondViewController, animated: true, completion: nil)
                return
                
//        for user in users {
//            if user.email == id && user.password == password {
//                print("Signin Success")
        
//                let secondViewController = SecondViewController()
//                secondViewController.currentUser = user
//                present(secondViewController, animated: true, completion: nil)
//                return
            }
        }
        
        alert(title: "이메일 주소 또는 비밀번호가 일치하지 않습니다.", message: "다시 입력해주세요.")
    }
        
        
        
    func alert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        UIView.animate(withDuration: 0.3, animations: <#T##() -> Void#>)
//        someView.frame.origin.y += 200
//    }


}

