//
//  CoordinateAddressView.swift
//  MapViewGoogleAPI
//
//  Created by Chunsu Kim on 14/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

protocol CoordinateAddressDelegate: class {
    func tappedLocationButton()
    func tappedSearch(text: String?)
}

class CoordinateAddressView: UIView {
    
    weak var delegate: CoordinateAddressDelegate?
    
    lazy var coordinateTextField: UITextField = {
        let textField = UITextField()
        textField.setLeftPaddingPoints(8)
        textField.placeholder = "Latitude, Longitude"
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        
        return textField
    }()
    
    lazy var currentLocationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Current Location", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(tappedLocationButton), for: .touchUpInside)
        
        return button
    }()
    
    
    lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Search", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(tappedSearch), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        let buttonStackView = UIStackView(arrangedSubviews: [currentLocationButton, searchButton])
        buttonStackView.spacing = 3
        buttonStackView.distribution = .fillEqually
        let stackView = UIStackView(arrangedSubviews: [coordinateTextField, buttonStackView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    @objc func tappedLocationButton() {
        delegate?.tappedLocationButton()
    }
    
    @objc func tappedSearch() {
        delegate?.tappedSearch(text: coordinateTextField.text)
    }
}

