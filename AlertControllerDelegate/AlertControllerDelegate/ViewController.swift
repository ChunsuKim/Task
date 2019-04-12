//
//  ViewController.swift
//  AlertControllerDelegate
//
//  Created by Chunsu Kim on 10/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    let alertControllerButton = UIButton(type: .system)
    var selectColor: UIColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - ViewController background setting
        view.backgroundColor = #colorLiteral(red: 0.7882475853, green: 0.7996634245, blue: 1, alpha: 1)
    }
    
    // MARK: - button 함수 호출
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        createAlertButton()
    }
    
    // MARK: - SecondViewController로 이동하기 위한 버튼 setting
    func createAlertButton() {
        
        let safeX = view.safeAreaInsets.left + view.safeAreaInsets.right
        let x = view.frame.width / 2 - safeX
        let safeY = view.safeAreaInsets.top + view.safeAreaInsets.bottom
        let y = view.frame.height / 2 - safeY
        
        // MARK: - alert button option 구현부
        alertControllerButton.frame = CGRect(x: x - 100, y: y, width: 200, height: 80)
        alertControllerButton.setTitle("Alert Button", for: .normal)
        alertControllerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        alertControllerButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        alertControllerButton.setTitleColor(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), for: .normal)
        alertControllerButton.layer.cornerRadius = 10
        
        alertControllerButton.addTarget(self, action: #selector(pageToSecondViewController(_:)), for: .touchUpInside)   // addTarget 지정
        
        view.addSubview(alertControllerButton)
    }
    
    // MARK: - "Alert 버튼을 눌렀을 때 커스터마이즈 한 secondview로 이동
    @objc func pageToSecondViewController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(withIdentifier: "buttonPage") as? SecondViewController else { return } // "buttonPage" = SecondViewController Storyboard ID
        secondViewController.delegate = self
        secondViewController.modalPresentationStyle = .overCurrentContext
        present(secondViewController, animated: true)
    }
}

// MARK: - 버튼을 눌렀을 때 값을 받아서 background color를 바꿔주는 구현부
extension ViewController: changeBackgroundColor {
    func sendColor(_ color: UIColor) {
        selectColor = color
        view.backgroundColor = selectColor
    }
}

