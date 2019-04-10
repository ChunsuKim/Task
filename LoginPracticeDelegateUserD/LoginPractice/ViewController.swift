//
//  ViewController.swift
//  LoginPractice
//
//  Created by Chunsu Kim on 05/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//



import UIKit

class ViewController: UIViewController, UITextFieldDelegate {       // Delegate 선언

    
    // MARK: - 스토리보드로 만든 텍스트필드, 버튼, 뷰 연결
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var viewForEmailPassword: UIView!
    @IBOutlet weak var moveToSignup: UIButton!
    // MARK: - userDefaults 상수 선언
    let userDefaults = UserDefaults.standard
    
    
    // MARK: - 텍스트필드를 활성화 시킬때 뷰가 이동하는 변수 지정
    var slidingUpViewForEmailPassword = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - 텍스트필드 옵션지정
        // MARK: - email 입력모드로 키보드적용
        emailTextField.keyboardType = UIKeyboardType.emailAddress
        // MARK: - 키보드 색상 어두운걸로 적용
        emailTextField.keyboardAppearance = UIKeyboardAppearance.dark
        // MARK: - 문자를 입력하지 않았을때 리턴키 비활성화 적용
        emailTextField.enablesReturnKeyAutomatically = true
        // MARK: - 내부에 클리어 버튼 표시
        emailTextField.clearButtonMode = UITextField.ViewMode.always
        
        // MARK: - 비밀번호 입력할때 입력된문자를 보안해주는 모드
        passwordTextField.isSecureTextEntry = true
        passwordTextField.keyboardAppearance = UIKeyboardAppearance.dark
        passwordTextField.enablesReturnKeyAutomatically = true
        passwordTextField.clearButtonMode = UITextField.ViewMode.always
        // MARK: - 키보드 타입 영문자 패드로
        passwordTextField.keyboardType = UIKeyboardType.alphabet
        

        // MARK: - Delegate 지정
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        }

    // MARK: - 텍스트 필드의 편집이 시작된 후 호출 method
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("택스트 필드의 편집이 시작되었습니다.")
        
        // MARK: - 뷰위치 위로 이동 구현
        guard slidingUpViewForEmailPassword == false else { return }
        UIView.animate(withDuration: 0.3) {
            self.viewForEmailPassword.frame.origin.y -= 250
            self.slidingUpViewForEmailPassword = true
        }
    }
    
    // MARK: - 텍스트 필드의 내용이 변경될 때 호출 method
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        print("텍스트 필드의 내용이 \(string)으로 변경됩니다.")
        
        // MARK: - 현재 텍스트필드에 입력된 길이와 더해질 문자의 길이의 합이 20을 넘는다면 반영하지 않음
        if (textField.text?.count)! + string.count > 21 {
            return false
        } else {
            return true
            }
    }
    

    
    // MARK: - 이메일과 비밀번호가 일치할 경우 SecondViewController로 signin 일치하지 않을 경우 alert창 띄우는 method
    @IBAction func signin(_ sender: UIButton) {
        // MARK: - email 택스트 필드가 비었으면 알터창 호출 비어있지 않으면 리턴하여 다음으로
        guard let id = emailTextField.text, !id.isEmpty else {
            alert(title: "이메일 주소가 누락되었습니다.", message: "이메일 주소를 입력해주세요.")
            return
        }
        // MARK: - password 택스트 필드가 비었으면 알터창 호출 비어있지 않으면 리턴하여 다음으로
        guard let password = passwordTextField.text, !password.isEmpty else {
            alert(title: "비밀번호가 누락되었습니다.", message: "비밀번호를 입력해주세요.")
            return
        }
        
        // MARK: - SignupViewController에서 생성한 딕셔너리타입의 id 와 password를 userDefaults로 불러와서 타입 캐스팅한다.
        let data = userDefaults.object(forKey: "users") as? [String: String] ?? [:]
        
        // MARK: - for문에 생성한 id와 password를 검사하게 하여 일치하면 SecondViewController로 present 시키고 틀리면 알터창 띄움
        for (key, value) in data {
            if key == id {
                if value == password {
                    let secondViewController = SecondViewController()
                    secondViewController.id = id
                    secondViewController.pw = password
                    present(secondViewController, animated: true, completion: nil)
                } else {
                    print("틀림")
                }
            }
        }
        
        alert(title: "Sign in 정보가 일치하지 않습니다.", message: "다시 입력해주세요.")
    }
        
        
    // MARK: - alert창 구현 method
    func alert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    
    
    // MARK: - 텍스트 필드의 리턴키가 눌러졌을 때 호출 method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("텍스트 필드의 리턴키가 눌러졌습니다.")
        
        // MARK: - 뷰위치 아래로 이동 구현
        UIView.animate(withDuration: 0.3) {
            self.viewForEmailPassword.frame.origin.y += 250
        }
        slidingUpViewForEmailPassword = false
        return true
    }
    
}

