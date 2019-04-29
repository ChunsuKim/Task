//
//  ViewController.swift
//  AutoLayoutExam
//
//  Created by Chunsu Kim on 26/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var redView: UIView! = UIView()
    
    @IBOutlet weak var grayView: UIView!
    
    
    var blueView: UIView = UIView()
    var navyView: UIView = UIView()
    var fourthLabel: UILabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setting()
        autoLayout()
    }
    
    func setting() {
        blueView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        navyView.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        fourthLabel.text = "네번째문제"
        fourthLabel.backgroundColor = .white
        fourthLabel.font = UIFont.systemFont(ofSize: 23)
        
        
        view.addSubview(blueView)
        blueView.addSubview(navyView)
        navyView.addSubview(fourthLabel)
    }
    
    func autoLayout() {
        
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        blueView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        blueView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        blueView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        blueView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        
        
        navyView.translatesAutoresizingMaskIntoConstraints = false
        
        navyView.centerYAnchor.constraint(equalTo: blueView.centerYAnchor).isActive = true
        navyView.centerXAnchor.constraint(equalTo: blueView.centerXAnchor).isActive = true
        navyView.widthAnchor.constraint(equalTo: blueView.widthAnchor, multiplier: 0.5).isActive = true
        navyView.heightAnchor.constraint(equalTo: blueView.heightAnchor, multiplier: 0.5).isActive = true
        
        
        fourthLabel.translatesAutoresizingMaskIntoConstraints = false
        
        fourthLabel.centerXAnchor.constraint(equalTo: navyView.centerXAnchor, constant: 20).isActive = true
        fourthLabel.centerYAnchor.constraint(equalTo: navyView.centerYAnchor).isActive = true
        fourthLabel.widthAnchor.constraint(greaterThanOrEqualTo: navyView.widthAnchor, multiplier: 0.7).isActive = true
    }


}

