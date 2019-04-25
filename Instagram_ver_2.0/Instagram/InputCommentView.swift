//
//  InputCommentView.swift
//  Instagram
//
//  Created by Chunsu Kim on 24/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

protocol InputCommentViewDelegate: class {
    func addCommentButtonDidTap(text: String)
}

class InputCommentView: UIView {
    
    weak var delegate: InputCommentViewDelegate?

    var emojis = ["😁","😂","👾","😡","😍","❤️","🙌🏿","🐈"]
    var buttons = [UIButton]()
    
    var textField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.placeholder = " Typing comment "
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField.layer.cornerRadius = 20
        textField.font = UIFont.systemFont(ofSize: 15)
        
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(addCommentButtonDidTap(_:)), for: .touchUpInside)
        button.setTitle("Post", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        textField.rightView = button
        textField.rightViewMode = .always
        
        
        
        
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.addSubview(textField)
        buttons = createEmojiBtns(emojis)
        textField.delegate = self
        
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        textField.topAnchor.constraint(equalTo: self.buttons[0].bottomAnchor).isActive = true
    }
    
    func createEmojiBtns(_ emojiArr: [String]) -> [UIButton] {
        var buttons = [UIButton]()
        for i in emojiArr {
            let button = UIButton(type: .custom)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(i, for: .normal)
            self.addSubview(button)
            print(Int(self.frame.width) / emojiArr.count)
            
            button.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
            button.addTarget(self, action: #selector(emojiButtonDidTap(_:)) , for: .touchUpInside)
            buttons.append(button)
        }
        
        let margin: CGFloat = 15
        buttons.first?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
        buttons.last?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin).isActive = true
        for i in 1..<buttons.count - 1 {
            buttons[i].leadingAnchor.constraint(equalTo: buttons[i - 1].trailingAnchor, constant: margin).isActive = true
        }
        
        return buttons
    }
    
    
    @objc func addCommentButtonDidTap(_ sender: UIButton) {
        
        delegate?.addCommentButtonDidTap(text: textField.text!)
            
        
        print("textField Empty")
    }
    
    @objc func emojiButtonDidTap(_ sender: UIButton) {
        
        textField.text = (textField.text! + sender.titleLabel!.text!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
}


extension InputCommentView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
