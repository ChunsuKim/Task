//
//  ViewController.swift
//  AutoLayoutPractice
//
//  Created by Chunsu Kim on 25/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let firstView: UIView = UIView()
    let secondView: UIView = UIView()
    let thirdView: UIView = UIView()
    let fourthView: UIView = UIView()
    let fifthView: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setting()
        autoLayout()
        
    }
    
    private func setting() {
        
        firstView.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        secondView.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        thirdView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        fourthView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        fifthView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        view.addSubview(firstView)
        view.addSubview(secondView)
        view.addSubview(thirdView)
        view.addSubview(fourthView)
        view.addSubview(fifthView)
    }
    
    private func autoLayout() {
        
        fifthView.translatesAutoresizingMaskIntoConstraints = false
        
        fifthView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        fifthView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        fifthView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        
        fourthView.translatesAutoresizingMaskIntoConstraints = false
        
        fourthView.widthAnchor.constraint(equalTo: fifthView.widthAnchor, multiplier: 0.7, constant: -1).isActive = true
        fourthView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        fourthView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        fourthView.trailingAnchor.constraint(equalTo: fifthView.leadingAnchor, constant: -8).isActive = true
        
        
        thirdView.translatesAutoresizingMaskIntoConstraints = false
        
        thirdView.widthAnchor.constraint(equalTo: fourthView.widthAnchor, multiplier: 0.7, constant: -2).isActive = true
        thirdView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        thirdView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        thirdView.trailingAnchor.constraint(equalTo: fourthView.leadingAnchor, constant: -8).isActive = true
        
        
        secondView.translatesAutoresizingMaskIntoConstraints = false
        
        secondView.widthAnchor.constraint(equalTo: thirdView.widthAnchor, multiplier: 0.7, constant: -3).isActive = true
        secondView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        secondView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        secondView.trailingAnchor.constraint(equalTo: thirdView.leadingAnchor, constant: -8).isActive = true
        
        
        firstView.translatesAutoresizingMaskIntoConstraints = false
        
        firstView.widthAnchor.constraint(equalTo: secondView.widthAnchor, multiplier: 0.7, constant: -4).isActive = true
        firstView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        firstView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        firstView.trailingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: -8).isActive = true
        firstView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        
        
    }


}

