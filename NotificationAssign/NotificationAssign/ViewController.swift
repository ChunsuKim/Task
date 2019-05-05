//
//  ViewController.swift
//  NotificationAssign
//
//  Created by Chunsu Kim on 05/05/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    let redLabel = UILabel()
    let greenLabel = UILabel()
    let blueLabel = UILabel()
    let alphaLabel = UILabel()
    
    let redSlider = UISlider()
    let greenSlider = UISlider()
    let blueSlider = UISlider()
    let alphaSlider = UISlider()
    
    let setButton = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        autoLayout()
    }
    
    
    func configure() {
        
        // Label setting
        redLabel.text = "Red"
        redLabel.font = UIFont.boldSystemFont(ofSize: 20)
        redLabel.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        redLabel.textAlignment = .center
        
        greenLabel.text = "Green"
        greenLabel.font = UIFont.boldSystemFont(ofSize: 20)
        greenLabel.textColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        greenLabel.textAlignment = .center
        
        blueLabel.text = "Blue"
        blueLabel.font = UIFont.boldSystemFont(ofSize: 20)
        blueLabel.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        blueLabel.textAlignment = .center
        
        alphaLabel.text = "Alpha"
        alphaLabel.font = UIFont.boldSystemFont(ofSize: 20)
        alphaLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        alphaLabel.textAlignment = .center
        
        // Silder setting
        redSlider.setValue(0.5, animated: true)
        greenSlider.setValue(0.5, animated: true)
        blueSlider.setValue(0.5, animated: true)
        alphaSlider.setValue(0.5, animated: true)
        
        // Button setting
        setButton.setTitle("Color Setting", for: .normal)
        setButton.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .normal)
        setButton.addTarget(self, action: #selector(setColordidTapButton(_:)), for: .touchUpInside)
        
        // addSubview
        view.addSubview(redLabel)
        view.addSubview(greenLabel)
        view.addSubview(blueLabel)
        view.addSubview(alphaLabel)
        
        view.addSubview(redSlider)
        view.addSubview(greenSlider)
        view.addSubview(blueSlider)
        view.addSubview(alphaSlider)
        
        view.addSubview(setButton)
    }
    
    
    func autoLayout() {
        redLabel.translatesAutoresizingMaskIntoConstraints = false
        redLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90).isActive = true
        redLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        redLabel.centerYAnchor.constraint(equalTo: redSlider.centerYAnchor).isActive = true
        
        redSlider.translatesAutoresizingMaskIntoConstraints = false
        redSlider.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90).isActive = true
        redSlider.leadingAnchor.constraint(equalTo: redLabel.trailingAnchor, constant: 15).isActive = true
        redSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        redSlider.widthAnchor.constraint(equalTo: redLabel.widthAnchor, multiplier: 3).isActive = true
        
        greenLabel.translatesAutoresizingMaskIntoConstraints = false
        greenLabel.topAnchor.constraint(equalTo: redLabel.bottomAnchor, constant: 30).isActive = true
        greenLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        greenLabel.centerYAnchor.constraint(equalTo: greenSlider.centerYAnchor).isActive = true
        
        greenSlider.translatesAutoresizingMaskIntoConstraints = false
        greenSlider.topAnchor.constraint(equalTo: redSlider.bottomAnchor, constant: 30).isActive = true
        greenSlider.leadingAnchor.constraint(equalTo: greenLabel.trailingAnchor, constant: 15).isActive = true
        greenSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        greenSlider.widthAnchor.constraint(equalTo: greenLabel.widthAnchor, multiplier: 3).isActive = true
        
        blueLabel.translatesAutoresizingMaskIntoConstraints = false
        blueLabel.topAnchor.constraint(equalTo: greenLabel.bottomAnchor, constant: 30).isActive = true
        blueLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        blueLabel.centerYAnchor.constraint(equalTo: blueSlider.centerYAnchor).isActive = true
        
        blueSlider.translatesAutoresizingMaskIntoConstraints = false
        blueSlider.topAnchor.constraint(equalTo: greenSlider.bottomAnchor, constant: 30).isActive = true
        blueSlider.leadingAnchor.constraint(equalTo: blueLabel.trailingAnchor, constant: 15).isActive = true
        blueSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        blueSlider.widthAnchor.constraint(equalTo: blueLabel.widthAnchor, multiplier: 3).isActive = true
        
        alphaLabel.translatesAutoresizingMaskIntoConstraints = false
        alphaLabel.topAnchor.constraint(equalTo: blueLabel.bottomAnchor, constant: 30).isActive = true
        alphaLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        alphaLabel.centerYAnchor.constraint(equalTo: alphaSlider.centerYAnchor).isActive = true
        
        alphaSlider.translatesAutoresizingMaskIntoConstraints = false
        alphaSlider.topAnchor.constraint(equalTo: blueSlider.bottomAnchor, constant: 30).isActive = true
        alphaSlider.leadingAnchor.constraint(equalTo: alphaLabel.trailingAnchor, constant: 15).isActive = true
        alphaSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        alphaSlider.widthAnchor.constraint(equalTo: alphaLabel.widthAnchor, multiplier: 3).isActive = true
        
        setButton.translatesAutoresizingMaskIntoConstraints = false
        setButton.topAnchor.constraint(equalTo: alphaLabel.bottomAnchor, constant: 40).isActive = true
        setButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    
    @objc func setColordidTapButton(_ noti: UIButton) {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        let alpha = CGFloat(alphaSlider.value)
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        NotificationCenter.default.post(name: Notification.Name("colorChangeNotification"), object: nil, userInfo: ["color": color])
    }
}

