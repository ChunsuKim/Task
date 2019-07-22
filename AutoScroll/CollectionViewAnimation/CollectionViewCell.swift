//
//  CollectionViewCell.swift
//  CollectionViewAnimation
//
//  Created by Chunsu Kim on 18/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLabel()
        configureLabelConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabel() {
        
        label.backgroundColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        contentView.addSubview(label)
    }
    
    private func configureLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
                label.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
                label.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func configureCellContent(text: String) {
        label.text = text
    }
}
