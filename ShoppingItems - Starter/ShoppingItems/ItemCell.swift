//
//  ItemCell.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

protocol PhoneStoreDelegate: class {
    func salesPhone(_ cell: ItemCell, _ seller: UILabel)
}


final class ItemCell: UITableViewCell {
    
    // MARK: - Properties
    var imageLogo: String = ""
    var itemName: String = ""
    var quantityMax: Int = 0
    var seller: Int = 0
    
    weak var delegate: PhoneStoreDelegate?
    let quantity = UILabel()
    let phoneImage = UIImageView()
    let label = UILabel()
    let button = UIButton(type: .custom)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(phoneImage)
        label.text = itemName
        print(itemName)
        label.textAlignment = .left
        contentView.addSubview(label)
        
        button.setImage(UIImage(named: "add"), for: .normal)
        button.addTarget(self, action: #selector(sale), for: .touchUpInside)
        contentView.addSubview(button)
        
        contentView.addSubview(quantity)
        
        // MARK: - AutoLayout
        phoneImage.translatesAutoresizingMaskIntoConstraints = false
        phoneImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        phoneImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        phoneImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        phoneImage.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -10).isActive = true
        phoneImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: phoneImage.trailingAnchor, constant: 10).isActive = true
        label.topAnchor.constraint(equalTo: phoneImage.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: phoneImage.bottomAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: quantity.leadingAnchor, constant: -10).isActive = true
        
        quantity.translatesAutoresizingMaskIntoConstraints = false
        quantity.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10).isActive = true
        quantity.topAnchor.constraint(equalTo: phoneImage.topAnchor).isActive = true
        quantity.bottomAnchor.constraint(equalTo: phoneImage.bottomAnchor).isActive = true
        quantity.trailingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        quantity.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: quantity.trailingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        button.topAnchor.constraint(equalTo: phoneImage.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: phoneImage.bottomAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func detailCell(_ image: String, _ name: String, counting: String, stockMax: Int) {
        
        self.phoneImage.image = UIImage(named: image)
        self.label.text = name
        self.quantity.text = counting
        self.quantityMax = stockMax
    }
    
    @objc func sale(_ sender: UIButton){
        delegate?.salesPhone(self, quantity)
    }
}
