//
//  LaunchScreenViewController.swift
//  AnimatedLaunchScreen
//
//  Created by Chunsu Kim on 14/06/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    var timer = Timer()
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        autoLayout()
        
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(goToMainView), userInfo: nil, repeats: false)
    }
    
    private func configure() {
        imageView.image = UIImage(named: "sunny")
        navigationController?.isNavigationBarHidden = true
        
        view.addSubview(imageView)
    }
    
    private func autoLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc private func goToMainView() {
        timer.invalidate()
        let viewController = ViewController()
        
        present(viewController, animated: true)
    }

}
