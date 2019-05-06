//
//  ThirdViewController.swift
//  NotificationAssign
//
//  Created by Chunsu Kim on 05/05/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    // MARK: - Properties
    let textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        autoLayout()
        textField.delegate = self
    }
    
    
    func configure() {
        textField.borderStyle = .roundedRect
        textField.placeholder = "Typing something."
        textField.textAlignment = .center
        textField.keyboardAppearance = UIKeyboardAppearance.dark
        textField.clearButtonMode = UITextField.ViewMode.always
        
        view.addSubview(textField)
    }
    
    
    func autoLayout() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
}

// MARK: - extension TextField Delegate
extension ThirdViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let text = textField.text ?? ""
        let fourthVC = FourthViewController()
        fourthVC.title = "Fourth"
        fourthVC.noti()
        
        // MARK: - Notification Declare
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ThirdViewText"), object: nil, userInfo: ["text": text])
        
        navigationController?.pushViewController(fourthVC, animated: true)
        
        return true
    }
}
