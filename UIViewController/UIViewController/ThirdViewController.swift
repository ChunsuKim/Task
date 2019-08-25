//
//  ThirdViewController.swift
//  UIViewController
//
//  Created by Chunsu Kim on 26/03/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var name = "Third View Controller"
    var from = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        view.backgroundColor = .gray
        print("presenting VC :", from)
        
        print("ThirdviewDidLoad")
        
        let buttonGoBlue = UIButton(type: .system)
        buttonGoBlue.frame = CGRect(x: view.frame.width / 2 - 75, y: 100, width: 150, height: 40)
        buttonGoBlue.addTarget(self, action: #selector(presentVC), for: .touchUpInside)
        buttonGoBlue.setTitle("Go to Green", for: .normal)
        buttonGoBlue.setTitleColor(.white, for: .normal)
        buttonGoBlue.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(buttonGoBlue)
        
//        print(view.frame.width)       // 414
        
        let buttonGoGreen = UIButton(type: .system)
        buttonGoGreen.frame = CGRect(x: view.frame.width / 2 - 75, y: 200, width: 150, height: 40)
        buttonGoGreen.addTarget(self, action: #selector(presentSecondVC), for: .touchUpInside)
        buttonGoGreen.setTitle("Go to Blue", for: .normal)
        buttonGoGreen.setTitleColor(.white, for: .normal)
        buttonGoGreen.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(buttonGoGreen)
        
        let buttonDismiss = UIButton(type: .system)
        buttonDismiss.frame = CGRect(x: view.frame.width / 2 - 75, y: 300, width: 150, height: 40)
        buttonDismiss.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        buttonDismiss.setTitle("Dismiss", for: .normal)
        buttonDismiss.setTitleColor(.white, for: .normal)
        buttonDismiss.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(buttonDismiss)
    }
    
    @objc func presentVC() {
        let vC = ViewController()
        vC.from = name
        present(vC, animated: true)
    }
    
    
    @objc func presentSecondVC() {
        let secondVC = SecondViewController()
        secondVC.from = name
        present(secondVC, animated: true)
    }
    
    @objc func dismissVC() {
        presentingViewController?.dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ThirdviewWillAppear")
    }
    
    override func viewDidAppear( _ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("ThirdviewDidAppear")
    }
    
    override func viewWillDisappear( _ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ThirdviewWilldisappear")
    }
    
    override func viewDidDisappear( _ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ThirdviewDiddisAppear")
    
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
