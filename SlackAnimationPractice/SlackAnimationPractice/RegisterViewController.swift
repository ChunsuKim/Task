  //
//  RegisterViewController.swift
//  SlackAnimationPractice
//
//  Created by Chunsu Kim on 16/05/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class RegisterViewController: UITabBarController {
    
    let registerTextField = UITextField()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        autoLayout()
    }
    
    private func configure() {
        
        view.backgroundColor = .white
        
        view.addSubviews([registerTextField, label])
        
    }
    
    private func autoLayout() {
        
        registerTextField.layout
            .leading(constant: 16)
            .trailing(constant: -16)
            .centerY(constant: -115)
    }
    

    

}
