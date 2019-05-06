//
//  FourthViewController.swift
//  NotificationAssign
//
//  Created by Chunsu Kim on 05/05/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    let textDisplayLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        autoLayout()
    }
    

    func configure() {
        textDisplayLabel.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        textDisplayLabel.textColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        textDisplayLabel.textAlignment = .center
        textDisplayLabel.font = UIFont.boldSystemFont(ofSize: 25)
        textDisplayLabel.layer.cornerRadius = 10
        textDisplayLabel.clipsToBounds = true
        
        view.addSubview(textDisplayLabel)
    }
    
    
    func autoLayout() {
        textDisplayLabel.translatesAutoresizingMaskIntoConstraints = false
        textDisplayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        textDisplayLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        textDisplayLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        textDisplayLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    // MARK: - Notification Observer
    func noti() {
        NotificationCenter.default.addObserver(self, selector: #selector(displayLabel(_:)), name: Notification.Name("ThirdViewText"), object: nil)
    }
    
    // MARK: - Action function
    @objc func displayLabel(_ noti: Notification) {
        
        guard let text = noti.userInfo?["text"] as? String else { return }
        print(text)
        textDisplayLabel.text = text
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
