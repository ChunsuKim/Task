//
//  ViewController.swift
//  FrameCode
//
//  Created by Chunsu Kim on 25/03/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let view1 = UIView()
        view1.frame = CGRect(x: 35, y: 35, width: view.frame.width - 35 - 35, height: view.frame.height - 35 - 35)
        view1.backgroundColor = .darkGray
        view.addSubview(view1)
        
        let view2 = UIView()
        view2.frame = CGRect(x: 35, y: 35, width: view1.frame.width - 35 - 35, height: view1.frame.height - 35 - 35)
        view2.backgroundColor = .gray
        view1.addSubview(view2)
        
        let view3 = UIView()
        view3.frame = CGRect(x: 35, y: 35, width: view2.frame.width - 35 - 35, height: view2.frame.height - 35 - 35)
        view3.backgroundColor = .lightGray
        view2.addSubview(view3)
    }


}




//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//
//        let view1 = UIView()
//        view1.frame = CGRect(x: 35, y: 35, width: view.frame.width - 35 - 35, height: view.frame.height - 35 - 35)
//        view1.backgroundColor = .darkGray
//        view.addSubview(view1)
//
//        let view2 = UIView()
//        view2.frame = CGRect(x: 45, y: 45, width: view.frame.width - 45 - 45, height: view.frame.height - 45 - 45)
//        view2.backgroundColor = .gray
//        view.addSubview(view2)
//
//        let view3 = UIView()
//        view3.frame = CGRect(x: 55, y: 55, width: view.frame.width - 55 - 55, height: view.frame.height - 55 - 55)
//        view3.backgroundColor = .lightGray
//        view.addSubview(view3)
//    }
//
//
//}
