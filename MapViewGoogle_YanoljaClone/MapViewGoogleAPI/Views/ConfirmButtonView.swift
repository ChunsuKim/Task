//
//  ConfirmButtonView.swift
//  MapViewGoogleAPI
//
//  Created by Chunsu Kim on 31/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ConfirmButtonView: UIView {

    lazy var confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("위치지정 완료", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.backgroundColor = #colorLiteral(red: 0.9893109202, green: 0.2117066383, blue: 0.4805865288, alpha: 1)
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureView() {
        addSubview(confirmButton)
        
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        confirmButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        confirmButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        confirmButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
