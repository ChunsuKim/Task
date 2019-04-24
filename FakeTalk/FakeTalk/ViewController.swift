//
//  ViewController.swift
//  FakeTalk
//
//  Created by Chunsu Kim on 24/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var friendsLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        _ = UIBarButtonItem(title: "Add Friend", style: .done, target: self, action: #selector(addViewController(_:)))
        
        friendsLabel = UILabel(frame: CGRect(x: 50, y: 200, width: view.frame.width - 100, height: view.frame.height - 400))
        friendsLabel?.backgroundColor = .blue
        friendsLabel?.font = UIFont.systemFont(ofSize: 30)
        friendsLabel?.textAlignment = .center
        friendsLabel?.numberOfLines = 0
        
        view.addSubview(friendsLabel!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc private func addViewController(_ sender: Any) {
        let secondViewController = SecondViewController()
        
        navigationController?.pushViewController(secondViewController, animated: true)
    }


}

extension ViewController: FriendNameAddDelegate {
    
    func addFriend(_ friends: [String]) {
        var friendList = ""
        for name in friends {
            friendList += name + "\n"
        }
        
        friendsLabel?.text = friendList
    }
}

