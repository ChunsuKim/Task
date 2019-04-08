//
//  SecondViewController.swift
//  LoginPractice
//
//  Created by Chunsu Kim on 05/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let greetingLabel: UILabel = UILabel()
    let backButton: UIButton = UIButton()
    let image: UIImageView = UIImageView()
    let welcomeLabel: UILabel = UILabel()
    
    let userDefaults = UserDefaults.standard
    
    var id = ""
    var pw = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        greetingLabel.text = "\(id)님 "
        greetingLabel.frame = CGRect(x: view.frame.maxX / 2 - 190, y: 100, width: 380, height: 200)
        greetingLabel.textAlignment = .center
        greetingLabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        greetingLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(greetingLabel)
//        print(view.frame.width)       // 414
        
        welcomeLabel.frame = CGRect(x: view.frame.maxX / 2 - 190, y: greetingLabel.frame.height - 50, width: 380, height: 200)
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 25)
        welcomeLabel.text = "환영합니다!"
        view.addSubview(welcomeLabel)
        
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
