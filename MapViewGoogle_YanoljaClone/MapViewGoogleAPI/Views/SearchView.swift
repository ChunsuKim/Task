//
//  SearchView.swift
//  MapViewGoogleAPI
//
//  Created by Chunsu Kim on 31/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

protocol CoordinateAddressDelegate: class {
//    func tappedLocationButton()
//    func tappedSearch(text: String?)
    func addressSearch()
}

class SearchView: UIView {

    weak var delegate: CoordinateAddressDelegate?
    
    lazy var coordinateTextField: UITextField = {
        let textField = UITextField()
        textField.setLeftPaddingPoints(8)
        textField.placeholder = "Latitude, Longitude"
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .white
        //        textField.layer.borderWidth = 1
        
        return textField
    }()
    
    lazy var currentLocationLabel: UILabel = {
        let label = UILabel()
        label.text = "현재 주소"
        label.textColor = .lightGray
        label.layer.cornerRadius = 5
        label.backgroundColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var currentLocationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("지역검색", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.9893109202, green: 0.2117066383, blue: 0.4805865288, alpha: 1), for: .normal)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        button.layer.cornerRadius = 5
        //        button.layer.borderWidth = 1
//        button.addTarget(self, action: #selector(tappedLocationButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("지하철검색", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.9893109202, green: 0.2117066383, blue: 0.4805865288, alpha: 1), for: .normal)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        button.layer.cornerRadius = 5
        //        button.layer.borderWidth = 1
//        button.addTarget(self, action: #selector(tappedSearch), for: .touchUpInside)
        
        return button
    }()
    
    lazy var addressSearchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("주소검색", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.9893109202, green: 0.2117066383, blue: 0.4805865288, alpha: 1), for: .normal)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        button.layer.cornerRadius = 5
        //        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(addressSearch), for: .touchUpInside)
        
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
        let buttonStackView = UIStackView(arrangedSubviews: [addressSearchButton, currentLocationButton, searchButton])
        buttonStackView.spacing = 3
        buttonStackView.distribution = .fillEqually
        let stackView = UIStackView(arrangedSubviews: [currentLocationLabel, buttonStackView])
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
    
//    @objc func tappedLocationButton() {
//        delegate?.tappedLocationButton()
//    }
//
//    @objc func tappedSearch() {
//        delegate?.tappedSearch(text: coordinateTextField.text)
//    }
    
    @objc func addressSearch() {
        delegate?.addressSearch()
    }
}

