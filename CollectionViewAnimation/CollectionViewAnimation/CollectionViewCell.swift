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
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureImageView()
        configureImageViewConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImageView() {
        
        imageView.clipsToBounds = true
        //        imageView.layer.cornerRadius = 7
        
        imageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(imageView)
    }
    
    private func configureImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        //        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        //        imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        //        imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        //        imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }
    
    func configureCellContent(image: UIImage?) {
        imageView.image = image
    }
}
