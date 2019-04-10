//
//  SecondViewController.swift
//  DeligatePractice
//
//  Created by Chunsu Kim on 10/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
    var delegate: TodoList?
    @IBOutlet weak var textField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    

    @IBAction func toViewController(_ sender: Any) {
        delegate?.textPresent(textField.text)
        dismiss(animated: true, completion: nil)
    }
    

}
