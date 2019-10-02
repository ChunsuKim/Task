//
//  ContactsTableViewCell.swift
//  ContactsParsing
//
//  Created by Chunsu Kim on 29/09/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    static let identifier = "ContactsTableViewCell"
    
    let nameLabel = UILabel()
    private let button = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createContentView()
    }
    
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
    
    private func createContentView() {
        nameLabel.text = ""
        nameLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        button.setTitle("친구추가", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .ultraLight)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(button)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func inputData(name: String) {
        nameLabel.text = name
    }

}
