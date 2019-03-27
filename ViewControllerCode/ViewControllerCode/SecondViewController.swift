//
//  SecondViewController.swift
//  ViewControllerCode
//
//  Created by Chunsu Kim on 27/03/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var label2 = UILabel()
    var countNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        
        label2.frame = CGRect(x: view.frame.width / 2 - 75, y: view.frame.height - 650, width: 150, height: 80)
        label2.textColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        label2.textAlignment = .center
        label2.text = "0"
        view.addSubview(label2)
        
        
        
        let buttonDismiss2 = UIButton(type: .system)
        buttonDismiss2.frame = CGRect(x: view.frame.width / 2 - 75, y: view.frame.height - 500, width: 150, height: 80)
        buttonDismiss2.addTarget(self, action: #selector(dismissSecondViewController), for: .touchUpInside)
        buttonDismiss2.setTitle("Dismiss", for: .normal)
        buttonDismiss2.setTitleColor(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), for: .normal)
        buttonDismiss2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(buttonDismiss2)
        

        // Do any additional setup after loading the view.
    }
    
    
    
    @objc func dismissSecondViewController() {
        guard let viewController = presentingViewController as? ViewController else { return }
        viewController.countNumber += 1
        
        presentingViewController?.dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let viewController = presentingViewController as? ViewController else { return }
        label2.text = String(viewController.countNumber)
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
