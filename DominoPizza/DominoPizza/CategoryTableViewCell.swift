//
//  CategoryTableViewCell.swift
//  DominoPizza
//
//  Created by Chunsu Kim on 30/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    let categoryMenuImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(categoryMenuImage)
        autoLayout()
    }
    
    func autoLayout() {
        
        
        categoryMenuImage.translatesAutoresizingMaskIntoConstraints = false
        
        categoryMenuImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        categoryMenuImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        categoryMenuImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        categoryMenuImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
//    func setImage(imageName: String) {
//        categoryMenuImage.image = UIImage(named: imageName)
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
