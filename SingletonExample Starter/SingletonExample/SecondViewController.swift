//
//  SecondViewController.swift
//  SingletonExample
//
//  Created by Chunsu Kim on 10/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userPasswordLabel: UILabel!
    @IBOutlet weak var userAgeLabel: UILabel!
    @IBOutlet weak var userPhoneLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameLabel.text = UserData.singleton.userName
        userPasswordLabel.text = UserData.singleton.userPassword
        userAgeLabel.text = UserData.singleton.userAge
        userPhoneLabel.text = UserData.singleton.userPhone
    }
    

   

}
