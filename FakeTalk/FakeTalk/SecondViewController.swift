//
//  SecondViewController.swift
//  FakeTalk
//
//  Created by Chunsu Kim on 24/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit


protocol FriendNameAddDelegate: class {
    
    func addFriend(_ friends: [String])
}

class SecondViewController: UIViewController {
    
    weak var delegate: FriendNameAddDelegate?
    var addFriend: UITextField? = UITextField()
    var friendArray: [String] = []
    var friendName: String = ""
    let addButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addFriend?.text = ""

        setting()
        autoLayout()
        
        
        addFriend?.delegate = self
    }
    
    func setting () {
//        addFriend = UITextField(frame: CGRect(x: 50, y: view.frame.height / 3 + 100, width: view.frame.width - 300, height: 80))
        addFriend?.font = UIFont.systemFont(ofSize: 30)
        addFriend?.borderStyle = .roundedRect
        addFriend?.layer.cornerRadius = 20
        addFriend?.textAlignment = .center
        addFriend?.placeholder = "Typing friend name"
        
        
//        addButton.frame = CGRect(x: addFriend!.frame.width + 10, y: view.frame.height / 3 + 100, width: view.frame.width - 300, height: 80)
        addButton.setTitle("Add", for: .normal)
        addButton.layer.cornerRadius = 15
        addButton.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        addButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        addButton.addTarget(self, action: #selector(addFriendButtonAction(_:)), for: .touchUpInside)
        
        
        view.addSubview(addFriend!)
        view.addSubview(addButton)
        
        
    }
    
    func autoLayout() {
        addFriend?.translatesAutoresizingMaskIntoConstraints = false
        
        addFriend?.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        addFriend?.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        addFriend?.widthAnchor.constraint(equalToConstant: 300).isActive = true
        addFriend?.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        addButton.topAnchor.constraint(equalTo: (addFriend?.safeAreaLayoutGuide.bottomAnchor)!, constant: 40).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func addFriendButtonAction(_ sender: UIButton) {
        addFriend?.resignFirstResponder()
        guard !friendName.isEmpty else {
            return alert(title: "Error", message: "Typing Name")
        }
        
        guard !friendArray.contains(friendName) else {
            return alert(title: "Error", message: "Existed Name")
        }
        
        friendArray.append(friendName)
        delegate?.addFriend(friendArray)
        
        alert(title: "Success", message: "\(friendName)" + " will be adding!")
        friendName.removeAll()
        addFriend?.text?.removeAll()
    }
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Confirm", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
        
    }
}

extension SecondViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        friendName = textField.text ?? ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        friendName = textField.text ?? "" + string
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        friendName = textField.text ?? ""
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        friendName = textField.text ?? ""
        
        return true
    }
    
}
