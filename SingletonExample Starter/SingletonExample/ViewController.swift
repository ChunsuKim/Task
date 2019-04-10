//
//  ViewController.swift
//  SingletonExample
//
//  Created by Wi on 10/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userAgeTextField: UITextField!
    @IBOutlet weak var userPhoneTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        userPasswordTextField.delegate = self
        userAgeTextField.delegate = self
        userPhoneTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let name = userNameTextField.text else { return true }
        guard let password = userPasswordTextField.text else { return true }
        guard let age = userAgeTextField.text else { return true }
        guard let phone = userPhoneTextField.text else { return true}
        
        UserData.singleton.userName = name
        UserData.singleton.userPassword = password
        UserData.singleton.userAge = age
        UserData.singleton.userPhone = phone
        
        
        userNameTextField.resignFirstResponder()
        userPasswordTextField.resignFirstResponder()
        userAgeTextField.resignFirstResponder()
        userPhoneTextField.resignFirstResponder()
        
        return true
    }
}

