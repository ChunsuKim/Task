//
//  ViewController.swift
//  TextFieldCode
//
//  Created by Chunsu Kim on 27/03/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//
//[ 과제 ]
//1. 영상 참고
//    > 텍스트 필드에 어떤 값을 입력하면 별도의 Label 에 입력된 텍스트 표시.
//        > 텍스트 필드가 활성화 되어 있을 땐 Label 의 텍스트 색상이 파란색이고, Font 크기는 40
//> 텍스트 필드가 비활성화되면 Label 텍스트 색상이 빨간색이고, Font 크기는 20


import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        print(view.frame.width)     //414
//        print(view.frame.height)    //896
        
        label.frame = CGRect(x: view.frame.width / 2 - 130, y: 100, width: 260, height: 80)
        label.textAlignment = .center
        label.text = "Show Box"
        label.backgroundColor = .gray
        label.layer.cornerRadius = 10
        view.addSubview(label)
        
        textField.frame = CGRect(x: view.frame.width / 2 - 130, y: 450, width: 260, height: 80)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .lightGray
        textField.placeholder = "Typing Something"
        textField.layer.cornerRadius = 10
        textField.textAlignment = .center
        textField.clearButtonMode = .whileEditing
        view.addSubview(textField)
        
        
        textField.addTarget(self, action: #selector(editingDidBegin(_:)), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        textField.addTarget(self, action: #selector(editingDidOnExit(_:)), for: .editingDidEndOnExit)
        
        
    }
    
    @objc func editingDidBegin (_ sender: UITextField) {
        label.textColor = . blue
        label.font = UIFont.boldSystemFont(ofSize: 40)
    }
    
    @objc func editingChanged (_ sender: UITextField) {
        label.text = textField.text
        
    }
    
    
    @objc func editingDidOnExit (_ sender: UITextField) {
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 20)
    }

}

