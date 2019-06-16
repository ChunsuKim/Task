//
//  LaunchScreenViewController.swift
//  WeatherForecast
//
//  Created by Chunsu Kim on 14/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class LaunchScreenViewController: UIViewController {
    
    // MARK: - Properties
    private var timer = Timer()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let activityIndicatorView = UIActivityIndicatorView()
    private let statusLabel = UILabel()
    private let copyRightLabel = UILabel()
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        autoLayout()
        activitiIndicatorOperation()

        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(goToMainView), userInfo: nil, repeats: false)
    }
    
    // MARK: - Configuration
    private func configure() {
        imageView.image = UIImage(named: "sunny")
        titleLabel.text = "Weather Forecast"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        activityIndicatorView.color = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        statusLabel.text = "날씨정보를 받아오는 중입니다!"
        statusLabel.textColor = .white
        statusLabel.textAlignment = .center
        statusLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        copyRightLabel.text = " Copyright (c) 2019. Chunsu Kim. All rights reserved."
        copyRightLabel.textColor = #colorLiteral(red: 0.009850479662, green: 0.29078269, blue: 0.5762767196, alpha: 1)
        copyRightLabel.textAlignment = .center
        copyRightLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        view.addSubview(imageView)
        imageView.addSubview(titleLabel)
        imageView.addSubview(activityIndicatorView)
        imageView.addSubview(statusLabel)
        imageView.addSubview(copyRightLabel)
    }
    
    private func autoLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        activityIndicatorView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        activityIndicatorView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.topAnchor.constraint(equalTo: activityIndicatorView.bottomAnchor, constant: 10).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        copyRightLabel.translatesAutoresizingMaskIntoConstraints = false
        copyRightLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        copyRightLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        copyRightLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        copyRightLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 15).isActive = true
    }
    
    private func activitiIndicatorOperation() {
        
        activityIndicatorView.startAnimating()
        
    }
    
    // MARK: - Action Methods
    @objc private func goToMainView() {
        timer.invalidate()
        let viewController = ViewController()

        present(viewController, animated: true)
        activityIndicatorView.stopAnimating()
        activityIndicatorView.hidesWhenStopped = true
    }
}
