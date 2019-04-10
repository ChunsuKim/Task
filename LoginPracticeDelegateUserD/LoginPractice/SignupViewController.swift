//
//  SignupViewController.swift
//  LoginPractice
//
//  Created by Chunsu Kim on 08/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {
    // MARK: - Properties
    
    // MARK: - IBOulet
    @IBOutlet weak var signupEmailTextField: UITextField!
    @IBOutlet weak var signupPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var moveToSigninButton: UIButton!
    @IBOutlet weak var siginupView: UIView!
    
    
    // MARK: - userDefaults 상수 선언
    let userDefaults = UserDefaults.standard
    
    // MARK: - 로그인 전체 뷰 변수 선언
    var slidingUpViewSiginup = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - 가입 이메일 계정을 위한 텍스트필드 옵션지정
        signupEmailTextField.keyboardType = UIKeyboardType.emailAddress
        signupEmailTextField.keyboardAppearance = UIKeyboardAppearance.dark
        signupEmailTextField.enablesReturnKeyAutomatically = true
        signupEmailTextField.clearButtonMode = UITextField.ViewMode.always
        
        // MARK: - 가입 비밀번호를 위한 텍스트필드 옵션지정
        signupPasswordTextField.isSecureTextEntry = true
        signupPasswordTextField.keyboardAppearance = UIKeyboardAppearance.dark
        signupPasswordTextField.enablesReturnKeyAutomatically = true
        signupPasswordTextField.clearButtonMode = UITextField.ViewMode.always
        signupPasswordTextField.keyboardType = UIKeyboardType.alphabet
        
        // MARK: - 택스트필드 델리게이트 지정
        self.signupEmailTextField.delegate = self
        self.signupPasswordTextField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("택스트 필드 편집 시작")
        
        // MARK: - 로그인 전체 뷰 위로 이동
        guard slidingUpViewSiginup == false else {
            return
        }
        UIView.animate(withDuration: 0.3) {
            self.siginupView.frame.origin.y -= 250
            self.slidingUpViewSiginup = true
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("택스트 필드의 내용이 \(string)으로 변경됩니다.")
        
        // MARK: - 20자 초과시 입력 불가
        if (textField.text?.count)! + string.count > 21 {
            return false
        } else {
            return true
        }
    }
    
    
    @IBAction func signup(_ sender: UIButton) {
        // MARK: - guard let 바인딩으로 nil이 아닐 경우 리턴
        guard let id = signupEmailTextField.text else { return }
        guard let pw = signupPasswordTextField.text else { return }
        
        // MARK: - 딕셔너리 타입으로 id와 pw를 key, value로 생성
        var tempDict: [String: String] = [:]
        tempDict[id] = pw
        
        // MARK: - 2번째 id, pw 생성부터 검사시작 및 이전 id, pw를 덮어쓰기 방지
        let usersData = userDefaults.object(forKey: "users") as? [String: String] ?? [:]
        
        for (id, pw) in usersData {
            tempDict[id] = pw
        }
        
        // MARK: - id, pw를 딕셔너리 타입으로 생성한 것을 users라는 키 값으로 userDefaults에 저장
        userDefaults.set(tempDict, forKey: "users")
        
        

    }
    
    // MARK: - signin page(ViewController)로 dismiss
    @IBAction func moveToSignin(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    

}
