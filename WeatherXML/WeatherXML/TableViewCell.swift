//
//  TableViewCell.swift
//  WeatherXML
//
//  Created by Chunsu Kim on 19/06/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "CustomCell"
    
    let countryLabel = UILabel()
    let weatherLabel = UILabel()
    let temperatureLabel = UILabel()
    let weatherImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCellUserInterface()
        configureConstraints()
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
    
    private func configureCellUserInterface() {
        countryLabel.textAlignment = .left
        countryLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        weatherLabel.textAlignment = .left
        weatherLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        temperatureLabel.textAlignment = .left
        temperatureLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        
        contentView.addSubview(countryLabel)
        contentView.addSubview(weatherLabel)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(weatherImageView)
    }
    
    private func configureConstraints() {
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        weatherImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        weatherImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        weatherImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        weatherImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        countryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        countryLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        countryLabel.trailingAnchor.constraint(equalTo: weatherImageView.leadingAnchor).isActive = true
        
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 5).isActive = true
        weatherLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        weatherLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        weatherLabel.trailingAnchor.constraint(equalTo: weatherImageView.leadingAnchor).isActive = true
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 5).isActive = true
        temperatureLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        temperatureLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        temperatureLabel.trailingAnchor.constraint(equalTo: weatherImageView.leadingAnchor).isActive = true
    }

}
