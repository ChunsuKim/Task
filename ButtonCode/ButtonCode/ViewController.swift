//
//  ViewController.swift
//  ButtonCode
//
//  Created by Chunsu Kim on 25/03/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let button = UIButton(type: .system)
    let lable = UILabel()
    var result: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        button.frame = CGRect(x: 150, y: 600, width: 114, height: 56)
        button.setTitle("Click Box", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(ClickBox(_:)), for: .touchUpInside)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 10
//        print(view.frame.width)     // 414
//        print(view.frame.height)    // 896
        view.addSubview(button)
        
        lable.frame = CGRect(x: 100, y: 200, width: 214, height: 100)
        lable.text = "Show Box"
        lable.textAlignment = .center
        lable.backgroundColor = .lightGray
        lable.layer.cornerRadius = 10
        lable.clipsToBounds = true
        
        view.addSubview(lable)
        }
    
    @objc func ClickBox(_ sender: Any)  {
        let alertController = UIAlertController(title: "Amazing Button", message: "Push the button, man!", preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: "UP", style: .default) { _ in
            print("UP")
            self.result += 1
            self.lable.text = String(self.result)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let voidAction = UIAlertAction(title: "Reset", style: .destructive) { _ in
            print("Reset")
            self.result = 0
            self.lable.text = String(self.result)
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        alertController.addAction(voidAction)
        
        present(alertController, animated: true)
    }


}

