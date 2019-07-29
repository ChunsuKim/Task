//
//  ViewController.swift
//  KeyboardShowAndHide
//
//  Created by Chunsu Kim on 30/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private let passwordConfirmTextField = UITextField()
    private let nameTextField = UITextField()
    private let cellphoneTextField = UITextField()
    
    private let idLineView = UIView()
    private let passwordLineView = UIView()
    private let passwordConfirmLineView = UIView()
    private let nameLineView = UIView()
    private let cellphoneLineView = UIView()
    
    private let buttonView = UIView()
    private let nextButton = UIButton()
    private let keyboardHeightView = UIView()
    
    private let noti = NotificationCenter.default

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureTextField()
        configureNextButton()
        hideKeyboard()
        initializeKeyboardEvent()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeKeyboardEvent()
    }

    private func configureTextField() {
        nameTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        nameTextField.placeholder = "이름"
        nameTextField.enablesReturnKeyAutomatically = true
        nameTextField.borderStyle = .none
        nameTextField.returnKeyType = .next
        nameTextField.autocorrectionType = .no
        nameTextField.autocapitalizationType = .none
        nameTextField.clearButtonMode = UITextField.ViewMode.always
        nameTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        nameTextField.textContentType = .name
        nameTextField.delegate = self
        nameTextField.inputAccessoryView = nil
        
        cellphoneTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        cellphoneTextField.placeholder = "휴대폰 번호 ex) 01012341234"
        cellphoneTextField.enablesReturnKeyAutomatically = true
        cellphoneTextField.borderStyle = .none
        cellphoneTextField.returnKeyType = .next
        cellphoneTextField.autocorrectionType = .no
        cellphoneTextField.autocapitalizationType = .none
        cellphoneTextField.clearButtonMode = UITextField.ViewMode.always
        cellphoneTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        cellphoneTextField.textContentType = .telephoneNumber
        cellphoneTextField.delegate = self
        cellphoneTextField.inputAccessoryView = nil
        
        idTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        idTextField.placeholder = "이메일"
        idTextField.enablesReturnKeyAutomatically = true
        idTextField.borderStyle = .none
        idTextField.returnKeyType = .next
        idTextField.autocorrectionType = .no
        idTextField.autocapitalizationType = .none
        idTextField.clearButtonMode = UITextField.ViewMode.always
        idTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        idTextField.textContentType = .emailAddress
        idTextField.delegate = self
        idTextField.inputAccessoryView = nil
        
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        passwordTextField.placeholder = "비밀번호 4자이상"
        passwordTextField.enablesReturnKeyAutomatically = true
        passwordTextField.borderStyle = .none
        passwordTextField.returnKeyType = .next
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.clearButtonMode = UITextField.ViewMode.always
        passwordTextField.isSecureTextEntry = true
        passwordTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        passwordTextField.delegate = self
        passwordTextField.textContentType = .password
        passwordTextField.inputAccessoryView = nil
        
        passwordConfirmTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        passwordConfirmTextField.placeholder = "비밀번호 확인"
        passwordConfirmTextField.enablesReturnKeyAutomatically = true
        passwordConfirmTextField.borderStyle = .none
        passwordConfirmTextField.autocorrectionType = .no
        passwordConfirmTextField.autocapitalizationType = .none
        passwordConfirmTextField.clearButtonMode = UITextField.ViewMode.always
        passwordConfirmTextField.isSecureTextEntry = true
        passwordConfirmTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        passwordConfirmTextField.delegate = self
        passwordConfirmTextField.textContentType = .password
        passwordConfirmTextField.inputAccessoryView = nil
        
        nameLineView.backgroundColor = #colorLiteral(red: 0.8774518967, green: 0.8826429248, blue: 0.8780108094, alpha: 1)
        cellphoneLineView.backgroundColor = #colorLiteral(red: 0.8774518967, green: 0.8826429248, blue: 0.8780108094, alpha: 1)
        idLineView.backgroundColor = #colorLiteral(red: 0.8774518967, green: 0.8826429248, blue: 0.8780108094, alpha: 1)
        passwordLineView.backgroundColor = #colorLiteral(red: 0.8774518967, green: 0.8826429248, blue: 0.8780108094, alpha: 1)
        passwordConfirmLineView.backgroundColor = #colorLiteral(red: 0.8774518967, green: 0.8826429248, blue: 0.8780108094, alpha: 1)
        
        view.addSubview(nameTextField)
        view.addSubview(nameLineView)
        
        view.addSubview(cellphoneTextField)
        view.addSubview(cellphoneLineView)
        
        view.addSubview(idTextField)
        view.addSubview(idLineView)
        
        view.addSubview(passwordTextField)
        view.addSubview(passwordLineView)
        
        view.addSubview(passwordConfirmTextField)
        view.addSubview(passwordConfirmLineView)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        nameLineView.translatesAutoresizingMaskIntoConstraints = false
        nameLineView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 5).isActive = true
        nameLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        nameLineView.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor, constant: -10).isActive = true
        nameLineView.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor, constant: 10).isActive = true
        
        cellphoneTextField.translatesAutoresizingMaskIntoConstraints = false
        cellphoneTextField.topAnchor.constraint(equalTo: nameLineView.bottomAnchor, constant: 25).isActive = true
        cellphoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        cellphoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        cellphoneTextField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        cellphoneLineView.translatesAutoresizingMaskIntoConstraints = false
        cellphoneLineView.topAnchor.constraint(equalTo: cellphoneTextField.bottomAnchor, constant: 5).isActive = true
        cellphoneLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        cellphoneLineView.leadingAnchor.constraint(equalTo: cellphoneTextField.leadingAnchor, constant: -10).isActive = true
        cellphoneLineView.trailingAnchor.constraint(equalTo: cellphoneTextField.trailingAnchor, constant: 10).isActive = true
        
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        idTextField.topAnchor.constraint(equalTo: cellphoneLineView.bottomAnchor, constant: 25).isActive = true
        idTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        idTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        idTextField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        idLineView.translatesAutoresizingMaskIntoConstraints = false
        idLineView.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 5).isActive = true
        idLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        idLineView.leadingAnchor.constraint(equalTo: idTextField.leadingAnchor, constant: -10).isActive = true
        idLineView.trailingAnchor.constraint(equalTo: idTextField.trailingAnchor, constant: 10).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: idLineView.bottomAnchor, constant: 25).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: idTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: idTextField.trailingAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: idTextField.heightAnchor).isActive = true
        
        passwordLineView.translatesAutoresizingMaskIntoConstraints = false
        passwordLineView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5).isActive = true
        passwordLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        passwordLineView.leadingAnchor.constraint(equalTo: idLineView.leadingAnchor).isActive = true
        passwordLineView.trailingAnchor.constraint(equalTo: idLineView.trailingAnchor).isActive = true
        
        passwordConfirmTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordConfirmTextField.topAnchor.constraint(equalTo: passwordLineView.bottomAnchor, constant: 25).isActive = true
        passwordConfirmTextField.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        passwordConfirmTextField.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
        passwordConfirmTextField.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor).isActive = true
        
        passwordConfirmLineView.translatesAutoresizingMaskIntoConstraints = false
        passwordConfirmLineView.topAnchor.constraint(equalTo: passwordConfirmTextField.bottomAnchor, constant: 5).isActive = true
        passwordConfirmLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        passwordConfirmLineView.leadingAnchor.constraint(equalTo: passwordLineView.leadingAnchor).isActive = true
        passwordConfirmLineView.trailingAnchor.constraint(equalTo: passwordLineView.trailingAnchor).isActive = true
    }
    
    private var buttonViewOriginBottomPriority: NSLayoutConstraint?
    private var keyboardHeightConstraint: NSLayoutConstraint?
    
    private func configureNextButton() {
        let nextButtonStringValue = "회원가입 완료\n현재 페이지 정보만 등록하면 회원가입 완료!"
        let nextButtonAttributedString: NSMutableAttributedString = NSMutableAttributedString(string: nextButtonStringValue)
        nextButtonAttributedString.setFontForText(textForAttribute: "회원가입 완료", withFont: UIFont.systemFont(ofSize: 17, weight: .semibold))
        nextButtonAttributedString.setFontForText(textForAttribute: "현재 페이지 정보만 등록하면 회원가입 완료!", withFont: UIFont.systemFont(ofSize: 11, weight: .semibold))
        
        // configuration button title two lines
        nextButton.titleLabel?.attributedText = nextButtonAttributedString
        nextButton.setTitle("회원가입 완료\n현재 페이지 정보만 등록하면 회원가입 완료!", for: .normal)
        nextButton.titleLabel?.numberOfLines = 0
        nextButton.titleLabel?.lineBreakMode = .byWordWrapping
        nextButton.titleLabel?.textAlignment = .center
        //
        nextButton.backgroundColor = .lightGray
        nextButton.layer.cornerRadius = 5
        
        nextButton.sizeToFit()
        nextButton.isEnabled = false
        nextButton.addTarget(self, action: #selector(nextButtonDidTap(_:)), for: .touchUpInside)
        
        let buttonLineView = UIView()
        buttonLineView.backgroundColor = #colorLiteral(red: 0.8774518967, green: 0.8826429248, blue: 0.8780108094, alpha: 1)
        
        buttonView.backgroundColor = .white
        
        view.addSubview(buttonView)
        view.addSubview(keyboardHeightView)
        buttonView.addSubview(nextButton)
        buttonView.addSubview(buttonLineView)
        
        keyboardHeightView.translatesAutoresizingMaskIntoConstraints = false
        keyboardHeightView.topAnchor.constraint(equalTo: buttonView.bottomAnchor).isActive = true
        keyboardHeightView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        keyboardHeightView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        keyboardHeightView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        keyboardHeightConstraint = keyboardHeightView.heightAnchor.constraint(equalToConstant: 0)
        keyboardHeightConstraint?.isActive = true
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.heightAnchor.constraint(equalToConstant: 62).isActive = true
        buttonView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        buttonView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        buttonViewOriginBottomPriority = buttonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        buttonViewOriginBottomPriority?.priority = UILayoutPriority(500)
        buttonViewOriginBottomPriority?.isActive = true
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.bottomAnchor.constraint(equalTo: buttonView.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: buttonView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: buttonView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        buttonLineView.translatesAutoresizingMaskIntoConstraints = false
        buttonLineView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -10).isActive = true
        buttonLineView.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor).isActive = true
        buttonLineView.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor).isActive = true
        buttonLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    @objc private func textFieldEditingChanged(_ sender: UITextField) {
        let id = idTextField.text
        let string = String()
        let passwordNecessary = (passwordTextField.text?.count)! + string.count > 4
        let passwordConfirm = (passwordConfirmTextField.text?.count)! + string.count > 4
        let nameConfirm = (nameTextField.text?.count)! + string.count > 1
        let cellphoneConfirm = (cellphoneTextField.text?.count)! + string.count > 9
        let checkPassword = passwordTextField.text
        let checkPasswordConfirm = passwordConfirmTextField.text
        if !(id!.isEmpty) && nameConfirm && cellphoneConfirm && passwordNecessary && passwordConfirm && (checkPassword == checkPasswordConfirm) {
            nextButton.isEnabled = true
            nextButton.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.2039215686, blue: 0.4705882353, alpha: 1)
        } else {
            nextButton.isEnabled = false
            nextButton.backgroundColor = .lightGray
        }
    }
    
    @objc private func nextButtonDidTap(_ sender: UIButton) {
        print("registerInfo post")
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        if textField == nameTextField {
            cellphoneTextField.becomeFirstResponder()
        } else if textField == cellphoneTextField {
            cellphoneTextField.resignFirstResponder()
            idTextField.becomeFirstResponder()
        } else if textField == idTextField {
            idTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
            passwordConfirmTextField.becomeFirstResponder()
        } else if textField == passwordConfirmTextField {
            passwordConfirmTextField.resignFirstResponder()
        }
        return true
    }
}

// MARK: - Hide Keyboard Extension
extension ViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension ViewController {
    private func initializeKeyboardEvent() {
        noti.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        noti.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeKeyboardEvent() {
        noti.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let userInfo: NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame: NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        
        self.keyboardHeightConstraint?.constant = keyboardHeight
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        self.keyboardHeightConstraint?.constant = 0
    }
}

// MARK: - Extension for String color and font
extension NSMutableAttributedString {
    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    
    func setFontForText(textForAttribute: String, withFont font: UIFont) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        self.addAttribute(NSAttributedString.Key.font, value: font, range: range)
    }
}
