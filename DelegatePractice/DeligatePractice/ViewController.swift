//
//  ViewController.swift
//  DeligatePractice
//
//  Created by Chunsu Kim on 10/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

protocol TodoList {
    func textPresent(_ text: String?)
}

class ViewController: UIViewController, TodoList {
    func textPresent(_ text: String?) {
        showLabel.text = text
    }
    
    
    
    @IBOutlet weak var showLabel: UILabel!
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLabel.layer.cornerRadius = 10
        showLabel.clipsToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let staffVC = segue.destination as? SecondViewController else {
            return
        }
        staffVC.delegate = self
        
    }
    
}

