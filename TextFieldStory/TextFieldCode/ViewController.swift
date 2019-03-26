//
//  ViewController.swift
//  TextFieldCode
//
//  Created by Chunsu Kim on 26/03/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField : UITextField!
    
    @IBOutlet weak var Lable: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func editingDidBegin(_ sender: UITextField) {
        print("editing did begin")
        Lable.textColor = .blue
        Lable.font = UIFont.boldSystemFont(ofSize: 40)
        
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
        print("editing changed")
        Lable.text = textField.text!
    }
    
    
    
    
    
    @IBAction func didEndOnExit(_ sender: Any) {
        print("did end on exit")
        
    }
    
    @IBAction func primaryActionTriggered(_ sender: Any) {
        print("primary action triggered")
    }
    
    @IBAction func editingDidEnd(_ sender: UITextField) {
        print("editing did end")
        Lable.textColor = .red
        Lable.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    
}

