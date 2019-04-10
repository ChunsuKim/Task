//
//  SecondViewController.swift
//  LoginPractice
//
//  Created by Chunsu Kim on 05/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var currentUser: User?
    
    let greetingLabel: UILabel = UILabel()
    let backButton: UIButton = UIButton()
    let image: UIImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        if let user = currentUser {
            greetingLabel.text = "\(user.name)님 환영합니다."
        }
        
        greetingLabel.frame = CGRect(x: view.frame.maxX / 2 - 150, y: 100, width: 300, height: 200)
        greetingLabel.textAlignment = .center
        greetingLabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        greetingLabel.font = UIFont.boldSystemFont(ofSize: 30)
        view.addSubview(greetingLabel)
        
        backButton.frame = CGRect(x: 20, y: 50, width: 30, height: 30)
        backButton.setImage(UIImage(named: "back_white"), for: .normal)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        view.addSubview(backButton)
        
        image.frame = CGRect(x: view.frame.maxX / 2 - 160, y: 350, width: 320, height: 220)
        image.image = UIImage(named: "apple")
        view.addSubview(image)
    }
    
    @objc func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
