//
//  ViewController.swift
//  AlertControllerExample
//
//  Created by Chunsu Kim on 25/03/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//버튼구현
    let button = UIButton(type: .system)


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        button.frame = CGRect(x: 100, y: 100, width: 80, height: 35)
        button.setTitle("버튼", for: .normal)
        button.addTarget(self, action: #selector(TapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    
//버튼누른 후 알림창 구현
    @objc func TapButton(_ sender: Any) {
        let alertController = UIAlertController(title: "타이틀", message: "메시지", preferredStyle: .actionSheet)     //.alert .actionSheet 창 띄우는 위치
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            print("OK")
        }
        
        let cancleAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let voidAction = UIAlertAction(title: "Void", style: .destructive) { _ in
            print("Do Nothing")
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancleAction)
        alertController.addAction(voidAction)
        
        present(alertController, animated: true)    // 새로운 창 띄워주기
    }
    


}

