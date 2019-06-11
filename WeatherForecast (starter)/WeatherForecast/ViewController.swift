//
//  ViewController.swift
//  WeatherForecast
//
//  Created by giftbot on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImageView = UIImageView()
    let dimmingView = UIView()
    let headerView = UIView()
    let headerViewLabel = UILabel()
    let detailTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        autoLayout()
    }
    
    private func configure() {
        backgroundImageView.image = UIImage(named: "sunny")
        headerView.backgroundColor = .clear
        headerViewLabel.textColor = .white
        headerViewLabel.font = UIFont.systemFont(ofSize: 20)
        headerViewLabel.textAlignment = .center
        headerViewLabel.text = "Label"
        dimmingView.backgroundColor = .black
        dimmingView.backgroundColor = UIColor.white.withAlphaComponent(0.4)

        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(dimmingView)
        backgroundImageView.addSubview(headerView)
        headerView.addSubview(headerViewLabel)
        backgroundImageView.addSubview(detailTableView)
    }

    private func autoLayout() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        headerViewLabel.translatesAutoresizingMaskIntoConstraints = false
        headerViewLabel.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
        headerViewLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor).isActive = true
        headerViewLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
        headerViewLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        
        detailTableView.translatesAutoresizingMaskIntoConstraints = false
        detailTableView.topAnchor.constraint(equalTo: headerViewLabel.bottomAnchor).isActive = true
        detailTableView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor).isActive = true
        detailTableView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor).isActive = true
        detailTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
        dimmingView.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor).isActive = true
        dimmingView.widthAnchor.constraint(equalTo: backgroundImageView.widthAnchor).isActive = true
        dimmingView.heightAnchor.constraint(equalTo: backgroundImageView.heightAnchor).isActive = true
    }
    

}
