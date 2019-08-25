//
//  ViewController.swift
//  UIViewController
//
//  Created by Chunsu Kim on 26/03/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var name = "First View Controller"
    var from = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .green
        print("presenting VC :", from)
        
        print("viewDidLoad")
        
        let buttonGoBlue = UIButton(type: .system)
        buttonGoBlue.frame = CGRect(x: view.frame.width / 2 - 75, y: 100, width: 150, height: 40)
        buttonGoBlue.addTarget(self, action: #selector(presentSecondVC), for: .touchUpInside)
        buttonGoBlue.setTitle("Go to Blue", for: .normal)
        buttonGoBlue.setTitleColor(.red, for: .normal)
        buttonGoBlue.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(buttonGoBlue)
        
        let buttonGoGray = UIButton(type: .system)
        buttonGoGray.frame = CGRect(x: view.frame.width / 2 - 75, y: 200, width: 150, height: 40)
        buttonGoGray.addTarget(self, action: #selector(presentThirdVC), for: .touchUpInside)
        buttonGoGray.setTitle("Go to Gray", for: .normal)
        buttonGoGray.setTitleColor(.red, for: .normal)
        buttonGoGray.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(buttonGoGray)
        
        let buttonDismiss = UIButton(type: .system)
        buttonDismiss.frame = CGRect(x: view.frame.width / 2 - 75, y: 300, width: 150, height: 40)
        buttonDismiss.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        buttonDismiss.setTitle("Dismiss", for: .normal)
        buttonDismiss.setTitleColor(.red, for: .normal)
        buttonDismiss.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(buttonDismiss)
    }
    
    @objc func presentSecondVC() {
        let secondVC = SecondViewController()
        secondVC.from = name
        present(secondVC, animated: true)
    }
    
    @objc func presentThirdVC() {
        let thirdVC = ThirdViewController()
        thirdVC.from = name
        present(thirdVC, animated: true)
    }
    
    @objc func dismissVC() {
        presentingViewController?.dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear( _ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewDidAppear")
    }
    
    override func viewWillDisappear( _ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWilldisappear")
    }
    
    override func viewDidDisappear( _ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDiddisAppear")
    }
    
    
    
}

