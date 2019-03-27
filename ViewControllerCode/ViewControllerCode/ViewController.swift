//
//  ViewController.swift
//  ViewControllerCode
//
//  Created by Chunsu Kim on 27/03/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lableFirstView = UILabel()
    var countNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: view.frame.width / 2 - 75, y: view.frame.height - 650, width: 150, height: 80)
        button.addTarget(self, action: #selector(presentSecondViewController), for: .touchUpInside)
        button.setTitle("Go to Next", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.655896306, green: 0.8254597783, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(button)
        
        
        lableFirstView.frame = CGRect(x: view.frame.width / 2 - 75, y: view.frame.height - 500, width: 150, height: 80)
        lableFirstView.text = "0"
        lableFirstView.textAlignment = .center
        lableFirstView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(lableFirstView)
    }
        
    
    @objc func presentSecondViewController() {
        let secondViewController = SecondViewController()
        countNumber += 1
        
        present(secondViewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let secondViewController = SecondViewController()
        lableFirstView.text = String(countNumber)
        
    }
    
    
 
    
    
    




}
