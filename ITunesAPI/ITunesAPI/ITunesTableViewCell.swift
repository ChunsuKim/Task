//
//  MainTableViewCell.swift
//  ITunesAPI
//
//  Created by Chunsu Kim on 09/06/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ITunesTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "ITunesTableViewCell"
    let musicImageView = UIImageView()
    let musicNameLabel = UILabel()
    let artistNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        autoLayout()
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
    
    // MARK: - Setting Method
    private func configure() {
        musicNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        contentView.addSubview(musicImageView)
        contentView.addSubview(musicNameLabel)
        contentView.addSubview(artistNameLabel)
    }
    
    private func autoLayout() {
        musicImageView.translatesAutoresizingMaskIntoConstraints = false
        musicImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        musicImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        musicImageView.widthAnchor.constraint(equalTo: musicImageView.heightAnchor).isActive = true
        musicImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        musicNameLabel.translatesAutoresizingMaskIntoConstraints = false
        musicNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        musicNameLabel.leadingAnchor.constraint(equalTo: musicImageView.trailingAnchor, constant: 10).isActive = true
        musicNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.topAnchor.constraint(equalTo: musicNameLabel.bottomAnchor).isActive = true
        artistNameLabel.leadingAnchor.constraint(equalTo: musicImageView.trailingAnchor, constant: 10).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        artistNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        artistNameLabel.heightAnchor.constraint(equalTo: musicNameLabel.heightAnchor).isActive = true
    }

}
