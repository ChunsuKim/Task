//
//  DetailTableViewCell.swift
//  WeatherForecast
//
//  Created by Chunsu Kim on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class DetailHeaderTableViewCell: UITableViewCell {
    
    static let identifier = "DetailHeaderTableViewCell"
    let headerCellWeatherImageView = UIImageView()
    let headerCellStatusLabel = UILabel()
    let headerCellMaxMintempLabel = UILabel()
    let headerCellThermometerLabel = UILabel()
    
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
    
    private func configure() {
        headerCellStatusLabel.font = UIFont.systemFont(ofSize: 30)
        headerCellThermometerLabel.font = UIFont.systemFont(ofSize: 100, weight: .ultraLight)
        
        contentView.addSubview(headerCellWeatherImageView)
        contentView.addSubview(headerCellStatusLabel)
        contentView.addSubview(headerCellMaxMintempLabel)
        contentView.addSubview(headerCellThermometerLabel)
    
    }
    
    private func autoLayout() {
        
        
        headerCellWeatherImageView.translatesAutoresizingMaskIntoConstraints = false
        headerCellWeatherImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        headerCellWeatherImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        headerCellWeatherImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        headerCellWeatherImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        headerCellStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        headerCellStatusLabel.topAnchor.constraint(equalTo: headerCellWeatherImageView.topAnchor).isActive = true
        headerCellStatusLabel.heightAnchor.constraint(equalTo: headerCellWeatherImageView.heightAnchor).isActive = true
        headerCellStatusLabel.leadingAnchor.constraint(equalTo: headerCellWeatherImageView.trailingAnchor, constant: 10).isActive = true
        headerCellStatusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        headerCellMaxMintempLabel.translatesAutoresizingMaskIntoConstraints = false
        headerCellMaxMintempLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        headerCellMaxMintempLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        headerCellMaxMintempLabel.topAnchor.constraint(equalTo: headerCellWeatherImageView.bottomAnchor, constant: 10).isActive = true
        headerCellMaxMintempLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        
        headerCellThermometerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerCellThermometerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        headerCellThermometerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        headerCellThermometerLabel.topAnchor.constraint(equalTo: headerCellMaxMintempLabel.bottomAnchor, constant: 10).isActive = true
        headerCellThermometerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        headerCellThermometerLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 999), for: .vertical)
    }

}
