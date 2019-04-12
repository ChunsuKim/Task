//
//  SecondViewController.swift
//  AlertControllerDelegate
//
//  Created by Chunsu Kim on 10/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

// MARK: - protocol 지정
protocol changeBackgroundColor: class {
    func sendColor(_ color: UIColor)
}

class SecondViewController: UIViewController {
    
    var delegate: changeBackgroundColor?    // delegate 변수선언
    
    // MARK: - Properties
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftButton.layer.cornerRadius = 10
        rightButton.layer.cornerRadius = 10
        backButton.layer.cornerRadius = 10
        
        backButton.addTarget(self, action: #selector(dismiss(_:)), for: .touchUpInside) // addTarget 지정

    }
    
    // MARK: - yellow, red button 값 전달 함수
    @IBAction func changeColor(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            delegate?.sendColor(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
        default:
            delegate?.sendColor(#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1))
        }
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    

}
