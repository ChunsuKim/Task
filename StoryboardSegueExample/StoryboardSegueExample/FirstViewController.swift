//
//  ViewController.swift
//  StoryboardSegueExample
//
//  Created by Chunsu Kim on 02/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        var shouldPerform: Bool = true
//        return shouldPerform
        
        return count < 50
        
    }
    
    
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        print("----------[prepare]-----------")
//        print("seque source :", segue.source)
        print("seque dest :", segue.destination)
//        print("seque id :", segue.identifier)
//        print("sender :", sender)
        
        guard let dest = segue.destination as? SecondViewController,
        let id = segue.identifier
        else { return }
        
        
        
        count += id == "PlusOne" ? 1 : 10
        dest.count = count
    
    
    
        
// sender - 이벤트를 보내는 객체
    }
    
   
    
}


