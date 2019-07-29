//
//  SecondViewController.swift
//  KeyboardShowAndHide
//
//  Created by Chunsu Kim on 30/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let nameTextField = UITextField()
    private let nameLineView = UIView()
    
    private let buttonView = UIView()
    private let nextButton = UIButton()
    
    private let noti = NotificationCenter.default

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        configureTextField()
        configureNextButton()
        hideKeyboard()
        configureNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardEvent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureNotification()
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
        nameTextField.textContentType = .name
        nameTextField.inputAccessoryView = nil
        
        nameLineView.backgroundColor = #colorLiteral(red: 0.8774518967, green: 0.8826429248, blue: 0.8780108094, alpha: 1)
        
        view.addSubview(nameTextField)
        view.addSubview(nameLineView)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        nameLineView.translatesAutoresizingMaskIntoConstraints = false
        nameLineView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 5).isActive = true
        nameLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        nameLineView.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor, constant: -10).isActive = true
        nameLineView.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor, constant: 10).isActive = true
    }
    
    private var buttonViewOriginBottomPriority: NSLayoutConstraint?
    private var keyboardHeightConstraint: NSLayoutConstraint?
    private var buttonViewBottomConstraintWithKeyboard: NSLayoutConstraint?
    private var buttonViewBottomConstraints: NSLayoutConstraint?
    private var flag = false
    
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
        
        let buttonLineView = UIView()
        buttonLineView.backgroundColor = #colorLiteral(red: 0.8774518967, green: 0.8826429248, blue: 0.8780108094, alpha: 1)
        
        buttonView.backgroundColor = .white
        
        view.addSubview(buttonView)
        buttonView.addSubview(nextButton)
        buttonView.addSubview(buttonLineView)
        
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

}

// MARK: - Hide Keyboard Extension
extension SecondViewController {
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

extension SecondViewController {
    private func configureNotification() {
        noti.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        noti.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeKeyboardEvent() {
        noti.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        
        guard let userInfo = notification.userInfo,
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
            else { return }
        
        if flag == false {
            buttonViewBottomConstraintWithKeyboard = buttonView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -keyboardFrame.height)
            buttonViewBottomConstraintWithKeyboard?.priority = .defaultLow
            buttonViewBottomConstraintWithKeyboard?.isActive = true
            
            buttonViewBottomConstraints = buttonView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
            buttonViewBottomConstraints?.priority = .defaultLow
            buttonViewBottomConstraints?.isActive = true
            flag = true
        }
        
        switch notification.name {
        case UIResponder.keyboardWillHideNotification:
            
            UIView.animate(withDuration: duration) {
                self.buttonViewBottomConstraintWithKeyboard?.priority = .defaultLow
                self.buttonViewBottomConstraints?.priority = .defaultHigh
            }
            self.view.layoutIfNeeded()
            
        case UIResponder.keyboardWillShowNotification:
            
            UIView.animate(withDuration: duration) {
                self.buttonViewBottomConstraints?.priority = .defaultLow
                self.buttonViewBottomConstraintWithKeyboard?.priority = .defaultHigh
                
            }
            self.view.layoutIfNeeded()
            
        default: break
        }
    }
}

