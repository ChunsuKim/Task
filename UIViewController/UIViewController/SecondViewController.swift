//
//  SecondViewController.swift
//  UIViewController
//
//  Created by Chunsu Kim on 26/03/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    var name = "Second View Controller"
    var from = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = . blue
        print("presenting VC :", from)
        
        print("SecondviewDidLoad")
        
        
        let buttonGoGreen = UIButton(type: .system)
        buttonGoGreen.frame = CGRect(x: view.frame.width / 2 - 75, y: 100, width: 150, height: 40)
        buttonGoGreen.addTarget(self, action: #selector(presentVC), for: .touchUpInside)
        buttonGoGreen.setTitle("Go to Green", for: .normal)
        buttonGoGreen.setTitleColor(.white, for: .normal)
        buttonGoGreen.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(buttonGoGreen)
        
        
        let buttonGoGray = UIButton(type: .system)
        buttonGoGray.frame = CGRect(x: view.frame.width / 2 - 75, y: 200, width: 150, height: 40)
        buttonGoGray.addTarget(self, action: #selector(presentThirdVC), for: .touchUpInside)
        buttonGoGray.setTitle("Go to Gray", for: .normal)
        buttonGoGray.setTitleColor(.white, for: .normal)
        buttonGoGray.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(buttonGoGray)
        
        let buttonDismiss = UIButton(type: .system)
        buttonDismiss.frame = CGRect(x: view.frame.width / 2 - 75, y: 300, width: 150, height: 40)
        buttonDismiss.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        buttonDismiss.setTitle("Dismiss", for: .normal)
        buttonDismiss.setTitleColor(.red, for: .normal)
        buttonDismiss.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(buttonDismiss)
    }
    @objc func presentVC() {
        let vC = ViewController()
        vC.from = name
        present(vC, animated: true)
    }
    
    @objc func presentThirdVC() {
        let thirdVC = ThirdViewController()
        thirdVC.from = name
        present(thirdVC, animated: true)
    }
    
    
    @objc func dismissVC() {
        presentingViewController?.dismiss(animated: true)           // 정석 코드(추천)
//        presentingViewController      // 나를 띄우게 만든 VC
//        persentedViewController      // 내가 띄운 VC
        
        
//        dismiss(animated: true)                                   // 대체 코드
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondviewWillAppear")
    }
    
    override func viewDidAppear( _ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondviewDidAppear")
    }
    
    override func viewWillDisappear( _ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SecondviewWilldisappear")
    }
    
    override func viewDidDisappear( _ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SecondviewDiddisAppear")
    
    }
    
    deinit {
        print("Second Deinit")           //  메모리상에서 해제되는지 보는 명령어
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
