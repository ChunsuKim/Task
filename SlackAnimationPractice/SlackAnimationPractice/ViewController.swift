//
//  ViewController.swift
//  SlackAnimationPractice
//
//  Created by Chunsu Kim on 16/05/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let createWorkSpaceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create New Workspace", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button.addTarget(self, action: #selector(didTapCreateWorkSpaceButton(_:)), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(createWorkSpaceButton)
        
        createWorkSpaceButton.layout.centerX().centerY()
        
//        createWorkSpaceButton.translatesAutoresizingMaskIntoConstraints = false
//        createWorkSpaceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        createWorkSpaceButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    @objc func didTapCreateWorkSpaceButton(_ sender: UIButton) {
        let vc = NameWSViewController()
        let naviController = UINavigationController(rootViewController: vc)
        present(naviController, animated: true)
    }
}

