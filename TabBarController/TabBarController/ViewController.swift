//
//  ViewController.swift
//  TabBarController
//
//  Created by Chunsu Kim on 05/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "First VC"
        view.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        
        
        let button = UIButton()
        button.frame = CGRect(x: view.frame.maxX / 2, y: 300, width: 100, height: 50)
        button.setTitle("Push", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let barButton = UIBarButtonItem(title: "push", style: .done, target: self, action: #selector(pushViewController(_:)))
        
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc private func didTapButton(_ sender: Any) {
        let thirdView = ThirdViewController()
        show(thirdView, sender: nil)
    }
    
    @objc private func pushViewController(_ sender: Any) {
        let secondVC = SecondViewController()
        
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    


}

