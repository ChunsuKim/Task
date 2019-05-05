//
//  SecondViewController.swift
//  NotificationAssign
//
//  Created by Chunsu Kim on 05/05/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let colorView = UIView()
    
    let notiCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        autoLayout()
        noti()
    }
    
    
    func configure() {
        view.addSubview(colorView)
    }
    
    
    func autoLayout() {
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        colorView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        colorView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        colorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60).isActive = true
    }
    
    
    func noti() {
        notiCenter.addObserver(self, selector: #selector(changingColor(_:)), name: Notification.Name("colorChangeNotification"), object: nil)
    }
    
    
    @objc func changingColor(_ noti: Notification) {
        guard let color = noti.userInfo?["color"] as? UIColor else { return }
        
        print(color)
        colorView.backgroundColor = color
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension SecondViewController {
    var colorChangeNotification: Notification.Name {
        return Notification.Name("colorChangeNotification")
    }
}
