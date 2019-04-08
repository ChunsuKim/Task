//
//  SignupViewController.swift
//  LoginPractice
//
//  Created by Chunsu Kim on 08/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var signupEmailTextField: UITextField!
    @IBOutlet weak var signupPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var moveToSigninButton: UIButton!
    @IBOutlet weak var siginupView: UIView!
    
    let userDefaults = UserDefaults.standard
    
    var slidingUpViewSiginup = false
    var newusers: ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        signupEmailTextField.keyboardType = UIKeyboardType.emailAddress
        signupEmailTextField.keyboardAppearance = UIKeyboardAppearance.dark
        signupEmailTextField.enablesReturnKeyAutomatically = true
        signupEmailTextField.clearButtonMode = UITextField.ViewMode.always
        
        signupPasswordTextField.isSecureTextEntry = true
        signupPasswordTextField.keyboardAppearance = UIKeyboardAppearance.dark
        signupPasswordTextField.enablesReturnKeyAutomatically = true
        signupPasswordTextField.clearButtonMode = UITextField.ViewMode.always
        signupPasswordTextField.keyboardType = UIKeyboardType.alphabet
        
        
        self.signupEmailTextField.delegate = self
        self.signupPasswordTextField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("택스트 필드 편집 시작")
        
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
        
        if (textField.text?.count)! + string.count > 21 {
            return false
        } else {
            return true
        }
    }
    
    @IBAction func signup(_ sender: UIButton) {
        guard let id = signupEmailTextField.text else {return}
        guard let pw = signupPasswordTextField.text else {return}
        
        var tempDict: [String: String] = [:]
        tempDict[id] = pw
        
        let usersData = userDefaults.object(forKey: "users") as? [String: String] ?? [:]
        
        for (id, pw) in usersData {
            tempDict[id] = pw
        }
        
        userDefaults.set(tempDict, forKey: "users")
        
        

    }
    
    
    @IBAction func moveToSignin(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    

}
