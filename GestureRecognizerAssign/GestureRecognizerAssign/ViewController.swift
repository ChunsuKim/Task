//
//  ViewController.swift
//  GestureRecognizerAssign
//
//  Created by Chunsu Kim on 08/05/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var countTextLabel = UILabel()
    var positionLabel = UILabel()
    
    var startPoint = CGPoint(x: 0, y: 0)
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        autoLayout()
        tapGestureConfigure()
        
    }
    
    func configure() {
        
        countTextLabel.backgroundColor = #colorLiteral(red: 1, green: 0.7697382569, blue: 0.9495329261, alpha: 1)
        countTextLabel.textColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        countTextLabel.textAlignment = .center
        countTextLabel.font = UIFont.boldSystemFont(ofSize: 20)
        countTextLabel.layer.cornerRadius = 10
        countTextLabel.clipsToBounds = true
        
        positionLabel.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        positionLabel.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        positionLabel.textAlignment = .center
        positionLabel.font = UIFont.boldSystemFont(ofSize: 20)
        positionLabel.layer.cornerRadius = 10
        positionLabel.clipsToBounds = true
        
        view.addSubview(countTextLabel)
        view.addSubview(positionLabel)
    }
    
    
    func autoLayout() {
        
        countTextLabel.translatesAutoresizingMaskIntoConstraints = false
        countTextLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        countTextLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        countTextLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        countTextLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        positionLabel.topAnchor.constraint(equalTo: countTextLabel.topAnchor, constant: 40).isActive = true
        positionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        positionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        positionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    func tapGestureConfigure() {
        let touchGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction(_:)))
        touchGesture.numberOfTapsRequired = 1
        touchGesture.numberOfTouchesRequired = 1
        
        view.addGestureRecognizer(touchGesture)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        
        print(touchPoint)
    }
    
    
    @objc func tapGestureAction(_ sender: UITapGestureRecognizer) {
        let touchPoint = sender.location(in: self.view)
        
        if abs(startPoint.x - touchPoint.x) >= 10 || abs(startPoint.y - touchPoint.y) >= 10 {
            count = 0
            print("초기화", abs(startPoint.x - touchPoint.x), abs(startPoint.y - touchPoint.y))
        }
        
        if count == 0 {
            startPoint = touchPoint
        }
        
        count += 1
        
        countTextLabel.text = "\(count)"
        positionLabel.text = "좌표 : (\(String(format: "%.3f", arguments: [touchPoint.x])), \(String(format: "%.3f", arguments: [touchPoint.y])))"
        
        print(count)
    }


}

