//
//  ViewController.swift
//  MyFirstProject
//
//  Created by Chunsu Kim on 22/03/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//



//[ 과제 ]
//    - UISwitch : On, Off 가 바뀔 때마다 Label 의 내용이 On, Off 로 표시되도록 구현

import UIKit

class ViewController: UIViewController {
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("==== view controller ====")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var result:Int = 0
    var click:Bool = true
    
    @IBOutlet weak var screen: UILabel!
    
        
    @IBAction func minusButton(_ sender: Any) {
        result -= 1
        screen.text = String(result)
    }
    
    
    @IBAction func plusButton(_ sender: Any) {
        result += 1
        screen.text = String(result)
    }
    
    @IBAction func `switch`(_ sender: Any) {
        if click == true {
            screen.isEnabled = false
            click = false
            result = 0
            screen.text = "Off"
        } else {
            screen.isEnabled = true
            click = true
            screen.text = "On"
        }
    }
}

